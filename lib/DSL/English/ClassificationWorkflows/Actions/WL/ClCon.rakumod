=begin comment
#==============================================================================
#
#   Classification Workflows WL-ClCon actions in Raku (Perl 6)
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

class DSL::English::ClassificationWorkflows::Actions::WL::ClCon
        is DSL::Shared::Actions::English::WL::PipelineCommand
        is DSL::English::ClassificationWorkflows::Actions::WL::ROCFunctions
        is DSL::English::ClassificationWorkflows::Actions::WL::ClassifierProperties
        is DSL::English::ClassificationWorkflows::Actions::WL::ClassifierMeasurements {

    method TOP($/) { make $/.values[0].made; }

    # Load data
    method data-load-command($/) { make $/.values[0].made; }
    method load-data-table($/) { make 'ClConUnit[ ExampleData[' ~ $<data-location-spec>.made ~ '] ]'; }
    method data-location-spec($/) { make '\'' ~ $/.Str ~ '\''; }
    method use-data-table($/) { make 'ClConUnit[ ' ~ $<variable-name>.made ~ ' ]'; }

    # Split command
	method split-data-command($/) { make $/.values[0].made; }
    method split-data-simple($/) {
        if $<split-fraction> {
          make 'ClConSplitData[ ' ~ $<split-fraction>.made ~ ' ]';
        } else {
          make 'ClConSplitData[ 0.75 ]';
        }
    }

    method split-data-spec($/) { make 'ClConSplitData[ ' ~ $<split-data-element-list>.made ~ ' ]'; }

    method split-data-element-list($/) { make $<split-data-element>>>.made.join(', '); }
    method split-data-element($/) { make $/.values[0].made; }

    method split-training-fraction($/)   { make '"TrainingFraction" -> ' ~ $<number-value>.made; }
    method split-validation-fraction($/) { make '"ValidationFraction" -> ' ~ $<number-value>.made; }
    method split-method($/) {
        if $<proportional-adjective> {
            make 'Method -> "LabelsProportional"';
        } else {
            make 'Method -> "Random"';
        }
    }
    method split-class-label-column($/) { make '"ClassLabelColumn" -> ' ~ $<variable-name>.made; }

    # Data summary command
    method data-summary-command($/) { make $/.values[0].made; }
    method data-summary-simple($/){ make 'ClConEchoDataSummary[]'; }

    # Reduce dimension command
    method reduce-dimension-command($/) { make $/.values[0].made; }
    method reduce-dimension-simple($/){ make 'ClConReduceDimension[]'; }

    # Make classifier command
    method make-classifier-command($/) { make $/.values[0].made; }
    method make-classifier-simple($/){
        if $<classifier-method-spec> {
            make 'ClConMakeClassifier[ ' ~ $<classifier-method-spec>.made ~ ' ]';
        } else {
            make 'ClConMakeClassifier[]';
        }
    }
    method classifier-method-spec($/) { make $/.values[0].made; }

    # Classifier info command
    method classifier-query-command($/) { make $/.values[0].made; }
    method classifier-info-simple($/){ make 'ClConEchoFunctionContext[ ClassifierInformation[#classifier]& ]'; }
    method classifier-get-info-property($/){ make 'ClConEchoFunctionContext[ Association @ Map[ Function[{pr}, pr -> Information[#classifier, pr]], { ' ~ $/.values[0].made ~ '}]& ]'; }
    method classifier-property-list($/) { make $<wl-classifier-info-property>>>.made.join(', '); }

    method classifier-counts($){ make 'ClConEchoFunctionContext[ Length @ #classifier ]'; }

    method classifier-info-property-name($/) { make $/.values[0].made; }
    method accuracy-property($/) { make 'Accuracy'; }
    method training-time-property($/) { make 'TrainingTime'; }
    method number-of-classes-property($/) { make 'ClassLabels'; }

    # Classifier measurements command
    method classifier-measurements-command($/) { make $/.values[0].made; }
    method classifier-measurements-simple($/){
        if $<classifier-measurements-list> {
            make 'ClConClassifierMeasurements[ {' ~ $<classifier-measurements-list>.made ~ '} ] ==> ClConEchoValue[]';
        } else {
            make 'ClConClassifierMeasurements[] ==> ClConEchoValue[]';
        }
    }
    method classifier-measurements-list($/) {
        make $<wl-classifier-measurement>>>.made.join(', ');
    }

    # Classifier testing command
    method classifier-testing-command($/) { make $/.values[0].made; }
    method classifier-testing-simple($/) {
        make 'ClConClassifierMeasurements[] ==> ClConEchoValue[]';
    }
    method accuracies-by-variable-shuffling($/) { make 'ClConAccuracyByVariableShuffling[]'; }
    method test-results($/) {
        if $<test-measures-list> && $<test-classification-threshold> {
            make 'ClConClassifierMeasurementsByThreshold[ {' ~ $<test-measures-list>.made ~ '}, ' ~ $<test-classification-threshold>.made ~ ' ] ==> ClConEchoValue[]';
        } elsif $<test-classification-threshold> {
            make 'ClConClassifierMeasurementsByThreshold[ "Precision", ' ~ $<test-classification-threshold>.made ~ ' ] ==> ClConEchoValue[]';
        } elsif $<test-measures-list> {
            make 'ClConClassifierMeasurements[ {' ~ $<test-measures-list>.made ~ '} ] ==> ClConEchoValue[]';
        } else {
            make 'ClConClassifierMeasurements[] ==> ClConEchoValue[]';
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
            make 'ClConROCPlot[ ' ~ $/.values[0].made ~ ' ]';
        } else {
            make 'ClConROCPlot[]';
        }
    }
    method roc-functions-list($/) { make $<roc-function>>>.made.join(', ');}

    # Data outliers command
    method data-outliers-command($/) { make $/.values[0].made; }
    method find-outliers-command($/) { make $/.values[0].made; }
    method remove-outliers-command($/) { make 'ClConRemoveOutliers[]'; }
    method show-outliers-command($/) { make 'ClConOutlierPosition[ ' ~ $<outliers-spec>.made ~ ' ] ==> ClConEchoValue[]'; }
    method outliers-spec($/) { make '"OutlierIdentifierParameters" -> ' ~ outlierFunctonFromSpec( $<outliers-type>.made ); }
    method outliers-type($/) { make $/.values[0].Str; }
    method find-outliers-all($/) { make 'ClConOutlierPosition[ ' ~ $<outliers-spec>.made ~ ' ]'; }
    method find-outliers-per-class($/) { make 'ClConOutlierPosition[ '~ $<outliers-spec>.made ~ ' ]'; }

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
    method assign-pipeline-object-to($/) { make 'ClConAssignTo[ ' ~ $/.values[0].made ~ ' ]'; }

    ## Value
    method assign-pipeline-value-to($/) { make 'ClConAssignValueTo[ ' ~ $/.values[0].made ~ ' ]'; }
    method take-pipeline-value($/) { make 'ClConTakeValue[]'; }
    method echo-pipeline-value($/) { make 'ClConEchoValue[]'; }
    method echo-pipeline-funciton-value($/) { make 'ClConEchoFunctionValue[ ' ~ $<pipeline-function-spec>.made ~ ' ]'; }

    ## Context
    method take-pipeline-context($/) { make 'ClConTakeContext[]'; }
    method echo-pipeline-context($/) { make 'ClConEchoContext[]'; }
    method echo-pipeline-function-context($/) { make 'ClConEchoFunctionContext[ ' ~ $<pipeline-function-spec>.made ~ ' ]'; }

    ## Echo messages
    method echo-command($/) { make 'ClConEcho[ ' ~ $<echo-message-spec>.made ~ ' ]'; }
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
