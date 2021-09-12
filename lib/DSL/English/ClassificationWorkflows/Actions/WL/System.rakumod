=begin comment
#==============================================================================
#
#   Classification Workflows WL-System actions in Raku (Perl 6)
#   Copyright (C) 2020  Anton Antonov
#
#   This program is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
#   Written by Anton Antonov,
#   antononcube @ gmai l . c om,
#   Windermere, Florida, USA.
#
#==============================================================================
#
#   For more details about Raku (Perl6) see https://raku.org/ .
#
#==============================================================================
=end comment

use v6;

use DSL::English::ClassificationWorkflows::Grammar;
use DSL::Shared::Actions::English::WL::PipelineCommand;
use DSL::English::ClassificationWorkflows::Actions::WL::ROCFunctions;
use DSL::English::ClassificationWorkflows::Actions::WL::ClassifierProperties;
use DSL::English::ClassificationWorkflows::Actions::WL::ClassifierMeasurements;

class DSL::English::ClassificationWorkflows::Actions::WL::System
        is DSL::Shared::Actions::English::WL::PipelineCommand
        is DSL::English::ClassificationWorkflows::Actions::WL::ROCFunctions
        is DSL::English::ClassificationWorkflows::Actions::WL::ClassifierProperties
        is DSL::English::ClassificationWorkflows::Actions::WL::ClassifierMeasurements {

    # Top
    method TOP($/) { make $/.values[0].made; }

    # workflow-command-list
    method workflow-commands-list($/) { make $/.values>>.made.join(";\n"); }

    # workflow-command
    method workflow-command($/) { make $/.values[0].made; }

    # Load data
    method data-load-command($/) { make $/.values[0].made; }
    method load-data-table($/) { make 'data = ExampleData @ ' ~ $<data-location-spec>.made; }
    method data-location-spec($/) { make '\'' ~ $/.Str ~ '\''; }
    method use-data-table($/) { make 'data = ClConToNormalClassifierData @ ' ~ $<variable-name>.made; }
    method use-classifier-object($/) { make 'clObj = ' ~ $<variable-name>.made; }

    # Split command
	method split-data-command($/) { make $/.values[0].made; }
    method split-data-simple($/) {
        my $sfr = $<split-fraction> ?? $<split-fraction>.made !! '0.75';
        make '{dataTraining, dataTesting} = TakeDrop[ RandomSample[data], Floor[ ' ~ $sfr ~ ' * Length[data] ] ]';
    }

    method split-data-spec($/) {
        my %splitArgs = $<split-data-element-list>.made;
        my $frac = %splitArgs<TrainingFraction>:exists ?? %splitArgs<TrainingFraction> !! '0.75';

        # Note that here append ';' because we produce two rows in this method.
        # (';' is appended in ToClassificationWorkflowCode using %targetToSeparator.)
        my $res = '{dataTraining, dataTesting} = TakeDrop[ RandomSample[data], Floor[ ' ~ $frac ~ ' * Length[data] ] ];';
        $res ~= "\n";

        if %splitArgs<ValidationFraction>:exists {
            $res ~= '{dataTraining, dataValidation} = TakeDrop[ RandomSample[dataTraining], Floor[ ' ~ %splitArgs<ValidationFraction> ~ ' * Length[dataTraining] ] ]';
        } else {
            $res ~= 'dataValidation = Automatic'
        }

        if %splitArgs<SplitMethodMethod>:exists {
            note 'Splitting method is not implemented in ClassificationWorkflows::Actions::WL::System.';
        }

        make $res;
    }

    method split-data-element-list($/) { make $<split-data-element>>>.made.hash; }
    method split-data-element($/) { make $/.values[0].made; }

    method split-training-fraction($/)   { make %(TrainingFraction => $<number-value>.made); }
    method split-validation-fraction($/) { make %(ValidationFraction => $<number-value>.made); }
    method split-method($/) {
        if $<proportional-adjective> {
            make %(SplitMethod => "LabelsProportional");
        } else {
            make %(SplitMethod => "Random");
        }
    }
    method split-class-label-column($/) { make  %(ClassLabelColumn => $<variable-name>.made); }

    # Data summary command
    method data-summary-command($/) { make $/.values[0].made; }
    method data-summary-simple($/){
        make 'Echo @ Map[ResourceFunction["RecordsSummary"][#, Thread -> True] &, <| "data" -> data, "dataTraining" -> dataTraining, "dataTesting" -> dataTesting|>]';
    }

    # Reduce dimension command
    method reduce-dimension-command($/) { make $/.values[0].made; }
    method reduce-dimension-simple($/){
        %.properties<DimensionReduction> = True;
        make 'feFunc = FeatureExtract[dataTraining]; ' ~ "\n" ~ 'dataTraining = feFunc /@ trainingData';
    }

    # Make classifier command
    method make-classifier-command($/) { make $/.values[0].made; }
    method make-classifier-simple-command($/){
        if $<classifier-method-spec> {
            make 'clObj = Classify[ dataTraining, Method -> ' ~ $<classifier-method-spec>.made ~ ', ValidationSet -> dataValidation ]';
        } else {
            make 'clObj = Classify[ dataTraining ]';
        }
    }
    method classifier-method-spec($/) { make $/.values[0].made; }

    # Make classifier ensemble command
    method classifier-ensemble-creation-command($/) { make $/.values[0].made; }
    method ensemble-by-single-method-command($/) {
        my $methodPart;
        my $resamplingPart;

        if $<ensemble-creation-num> {
            $methodPart = $<ensemble-creation-num>.made;
        } elsif $<ensemble-creation-simple> {
            $methodPart = $<ensemble-creation-simple>.made
        }

        $resamplingPart = $<resampling-spec> ?? $<resampling-spec>.made !!  '"samplingFunction" -> "RandomSample", "samplingFraction" -> 0.95';

        make 'clObj = EnsembleClassify[ dataTraining, <| ' ~ $methodPart ~ ', ' ~ $resamplingPart ~ ' |> ]';
    }
    method ensemble-creation-simple($/) {
        make '"method" -> ' ~ $<classifier-method-spec>.made ~ ', "numberOfClassifiers" -> 3';
    }
    method ensemble-creation-num($/) {
        make '"method" -> ' ~ $<classifier-method-spec>.made ~ ', "numberOfClassifiers" -> ' ~ $<number-of-classifiers>.made;
    }
    method resampling-spec($/) {
        my $rfunc = $<resampling-function> ?? $<resampling-function>.made !! '"RandomSample"';
        my $rfrac = $<resampling-fraction> ?? $<resampling-fraction>.made !! '0.95';

        make '"samplingFunction" -> ' ~ $rfunc ~ ', "samplingFraction" -> ' ~ $rfrac;
    }
    method resampling-function($/) { '"' ~ $/.Str ~ '"'; }
    method number-of-classifiers($/) { make $/.values[0].made; }
    method resampling-fraction-spec($/) { make $/.values[0].made; }

    # Classifier info command
    method classifier-query-command($/) { make $/.values[0].made; }
    method classifier-info-simple($/){ make 'Echo @ ClassifierInformation[clObj]'; }
    method classifier-get-info-property($/){ make 'Echo @ Association @ Map[ Function[{pr}, pr -> Information[clObj, pr]], { ' ~ $/.values[0].made ~ '}]'; }
    method classifier-property-list($/) { make $<wl-classifier-info-property>>>.made.join(', '); }

    method classifier-counts($){ make 'Echo[ Length @ clObj ]'; }

    method classifier-info-property-name($/) { make $/.values[0].made; }
    method accuracy-property($/) { make 'Accuracy'; }
    method training-time-property($/) { make 'TrainingTime'; }
    method number-of-classes-property($/) { make 'ClassLabels'; }

    # Classifier measurements command
    method classifier-measurements-command($/) { make $/.values[0].made; }
    method classifier-measurements-simple($/){
        if $<classifier-measurements-list> {
            make 'Echo @ ClassifierMeasurements[clObj, dataTesting, {' ~ $<classifier-measurements-list>.made ~ '}]';
        } else {
            make 'Echo @ ClassifierMeasurements[clObj, dataTesting]';
        }
    }
    method classifier-measurements-list($/) {
        make $<wl-classifier-measurement>>>.made.join(', ');
    }

    # Classifier testing command
    method classifier-testing-command($/) { make $/.values[0].made; }
    method classifier-testing-simple($/) {
        make 'Echo @ ClassifierMeasurements[clObj, dataTesting, {"Accuracy", "Precision", "Recall"}]';
    }
    method accuracies-by-variable-shuffling($/) { make 'ClConAccuracyByVariableShuffling[]'; }
    method test-results($/) {
        if $<test-measures-list> && $<test-classification-threshold> {
            make 'Echo @ ClassifierMeasurementsByThreshold[ {' ~ $<test-measures-list>.made ~ '}, ' ~ $<test-classification-threshold>.made ~ ' ]';
        } elsif $<test-classification-threshold> {
            make 'Echo @ ClassifierMeasurementsByThreshold[ "Precision", ' ~ $<test-classification-threshold>.made ~ ' ]';
        } elsif $<test-measures-list> {
            make 'Echo @ ClassifierMeasurements[clObj, dataTesting, {' ~ $<test-measures-list>.made ~ '} ]';
        } else {
            make 'Echo @ ClassifierMeasurements[clObj, dataTesting]';
        }
    }
    method test-classification-threshold($/){
        make $<class-label>.made ~ ' -> ' ~ $<threshold>.made;
    }
    method test-measures-list($/) {
        make $<wl-classifier-measurement>>>.made.join(', ');
    }

    # ROC plots command
    method roc-plots-command($/) { make $/.values[0].made; }
    method roc-curves-simple($/){ make 'ClConROCPlot[]'; }
    method roc-diagrams-command($/) {
        if $<roc-functions-list> {
            make 'Echo @ ROCPlot[ ' ~ $/.values[0].made ~ ' ]';
        } else {
            make 'Echo @ ROCPlot[]';
        }
    }
    method roc-functions-list($/) { make $<roc-function>>>.made.join(', ');}

    # Data outliers command
    method data-outliers-command($/) { make $/.values[0].made; }
    method find-outliers-command($/) { make $/.values[0].made; }
    method remove-outliers-command($/) { make 'Echo["Remoming outliers is not implemented"]'; }
    method show-outliers-command($/) { make 'Echo @ OutlierPosition[ trainDaat, ' ~ $<outliers-spec>.made ~ ' ]'; }
    method outliers-spec($/) { make '"OutlierIdentifierParameters" -> ' ~ outlierFunctonFromSpec( $<outliers-type>.made ); }
    method outliers-type($/) { make $/.values[0].Str; }
    method find-outliers-all($/) { make 'Echo @ OutlierPosition[ dataTraining, ' ~ $<outliers-spec>.made ~ ' ]'; }
    method find-outliers-per-class($/) { make 'Echo @ OutlierPosition[ dataTraining, '~ $<outliers-spec>.made ~ ' ]'; }

    # WL classifier names
    method wl-classifier-name($/) { make '"' ~ $/.values[0].made ~ '"'; }
    method decision-tree-classifier-name($/) { make 'DecisionTree'; }
    method gradient-boosted-trees-classifier-name($/) { make 'GradientBoostedTrees'; }
    method logistic-regression-classifier-name($/) { make 'LogisticRegression'; }
    method naive-bayes-classifier-name($/) { make 'NaiveBayes'; }
    method nearest-neighbors-classifier-name($/) { make 'NearestNeighbors'; }
    method neural-network-classifier-name($/) { make 'NeuralNetwork'; }
    method random-forest-classifier-name($/) { make 'RandomForest'; }
    method support-vector-machine-classifier-name($/) { make 'SupportVectorMachine' };

    # Pipeline command overwrites
    ## Object
    method assign-pipeline-object-to($/) {
        make $/.values[0].made ~ ' = ' ~ makeContextSpec( %.properties );
    }

    ## Value
    method assign-pipeline-value-to($/) { make 'ClConAssignValueTo[ ' ~ $/.values[0].made ~ ' ]'; }
    method take-pipeline-value($/) { make 'ClConTakeValue[]'; }
    method echo-pipeline-value($/) { make 'ClConEchoValue[]'; }
    method echo-pipeline-funciton-value($/) { make 'ClConEchoFunctionValue[ ' ~ $<pipeline-function-spec>.made ~ ' ]'; }

    ## Context
    method take-pipeline-context($/) { make makeContextSpec( %.properties ); }
    method echo-pipeline-context($/) { make 'Echo @ ' ~ makeContextSpec( %.properties ); }
    method echo-pipeline-function-context($/) { make $<pipeline-function-spec>.made ~ ' @ ' ~ makeContextSpec( %.properties ); }

    ## Echo messages
    method echo-command($/) { make 'Echo[ ' ~ $<echo-message-spec>.made ~ ' ]'; }

    ## Setup code
    method setup-code-command($/) {
        make q:to/SETUPEND/
    Import["https://raw.githubusercontent.com/antononcube/MathematicaForPrediction/master/MonadicProgramming/MonadicContextualClassification.m"];
    SETUPEND
    }
}

sub outlierFunctonFromSpec( Str $spec ) {
    return
            do given $spec {
                when 'top'      { 'TopOutliers@*SPLUSQuartileIdentifierParameters' }
                when 'largest'  { 'TopOutliers@*SPLUSQuartileIdentifierParameters' }
                when 'bottom'   { 'BottomOutliers@*SPLUSQuartileIdentifierParameters' }
                when 'smallest' { 'BottomOutliers@*SPLUSQuartileIdentifierParameters' }
                default         { 'SPLUSQuartileIdentifierParameters' }
            };
}

sub makeContextSpec( %props ) {
    my $res = '"data" -> data, "dataTraining" -> dataTraining, "dataTesting" -> dataTesting, "classifier" -> clObj';
    if %props<DimensionReduction>:exists {
        $res = $res ~ ', "featureExtractor" -> feFunc'
    }
    return '<| ' ~ $res ~ ' |>';
}