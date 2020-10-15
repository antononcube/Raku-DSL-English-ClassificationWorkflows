use v6;

use DSL::Shared::Roles::English::PipelineCommand;
use DSL::Shared::Utilities::FuzzyMatching;

# Data query specific phrases
role DSL::English::ClassificationWorkflows::Grammar::ClassificationPhrases
        does DSL::Shared::Roles::English::PipelineCommand {
    # Tokens
    token accuracy-noun { 'accuracy' | ([\w]+) <?{ $0.Str ne 'accuracies' and is-fuzzy-match( $0.Str, 'accuracy') }> }
    token accuracies-noun { 'accuracies' | ([\w]+) <?{ $0.Str ne 'accuracy' and is-fuzzy-match( $0.Str, 'accuracies') }> }
    token available-adjective { 'available' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'available') }> }
    token characteristic-noun { 'characteristic' | ([\w]+) <?{ $0.Str ne 'characteristics' and is-fuzzy-match( $0.Str, 'characteristic') }> }
    token characteristics-noun { 'characteristics' | ([\w]+) <?{ $0.Str ne 'characteristic' and is-fuzzy-match( $0.Str, 'characteristics') }> }
    token class-noun { 'class' | ([\w]+) <?{ $0.Str ne 'classes' and is-fuzzy-match( $0.Str, 'class') }> }
    token classes-noun { 'classes' | ([\w]+) <?{ $0.Str ne 'class' and is-fuzzy-match( $0.Str, 'classes') }> }
    token classification-noun { 'classification' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'classification') }> }
    token classifier-noun { 'classifier' | ([\w]+) <?{ $0.Str ne 'classifiers' and is-fuzzy-match( $0.Str, 'classifier') }> }
    token classifiers-noun { 'classifiers' | ([\w]+) <?{ $0.Str ne 'classifier' and is-fuzzy-match( $0.Str, 'classifiers') }> }
    token curve-noun { 'curve' | ([\w]+) <?{ $0.Str ne 'curves' and is-fuzzy-match( $0.Str, 'curve') }> }
    token curves-noun { 'curves' | ([\w]+) <?{ $0.Str ne 'curve' and is-fuzzy-match( $0.Str, 'curves') }> }
    token ensemble-noun { 'ensemble' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'ensemble') }> }
    token estimates-noun { 'estimates' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'estimates') }> }
    token fraction-noun { 'fraction' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'fraction') }> }
    token importance-noun { 'importance' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'importance') }> }
    token info-noun { 'info' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'info') }> }
    token information-noun { 'information' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'information') }> }
    token label-noun { 'label' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'label') }> }
    token line-noun { 'line' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'line') }> }
    token measurement-noun { 'measurement' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'measurement') }> }
    token measurements-noun { 'measurements' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'measurements') }> }
    token operating-adjective { 'operating' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'operating') }> }
    token proportional-adjective { 'proportional' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'proportional') }> }
    token random-adjective { 'random' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'random') }> }
    token ratio-noun { 'ratio' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'ratio') }> }
    token receiver-noun { 'receiver' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'receiver') }> }
    token reduce-verb { 'reduces' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'reduces') }> }
    token results-noun { 'results' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'results') }>}
    token roc-noun { 'roc' | ([\w]+) <?{ $0.Str ne 'rocs' and is-fuzzy-match( $0.Str, 'roc') }> }
    token rocs-noun { 'rocs' | ([\w]+) <?{ $0.Str ne 'roc' and is-fuzzy-match( $0.Str, 'roc') }> }
    token shuffling-noun { 'shuffling' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'shuffling') }>}
    token split-directive { 'split' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'split') }> | 'divide' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'divide') }> | 'partition' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'partition') }> }
    token split-verb { 'split' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'split') }> }
    token threshold-noun { 'threshold' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'threshold') }>}
    token test-verb { 'test' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'test') }> }
    token testing-adjective { 'testing' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'testing') }> }
    token train-verb { 'train' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'train') }> }
    token training-adjective { 'training' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'training') }> }
    token validation-adjective { 'validation' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'validation') }> }

    # Rules
    rule classifier-ensemble-phrase { <classifier-noun> <ensemble-noun> }
    rule classifier-info-phrase { <classifier-noun> [ <info-noun> | <information-noun> ] }
    rule reduce-dimension-phrase { <reduce-verb> <dimension> }
    rule roc-phrase { <receiver-noun> <operating-adjective> <characteristic-noun> | <roc-noun> }
    rule rocs-phrase { <receiver-noun> <operating-adjective> <characteristics-noun> | <rocs-noun> }
    rule roc-curve-phrase { [ <roc-phrase> | <rocs-phrase> ] [ <curve-noun> | <curves-noun> ]? }

    # WL classifier names
    rule wl-classifier-name {
        <decision-tree-classifier-name> |
        <gradient-boosted-trees-classifier-name> |
        <logistic-regression-classifier-name> |
        <naive-bayes-classifier-name> |
        <nearest-neighbors-classifier-name> |
        <neural-network-classifier-name> |
        <random-forest-classifier-name> |
        <support-vector-machine-classifier-name> }
    rule decision-tree-classifier-name { 'decision' 'tree' | 'DecisionTree' }
    rule gradient-boosted-trees-classifier-name { 'gradient' 'boosted' 'trees' | 'GradientBoostedTrees' }
    rule logistic-regression-classifier-name { 'logistic' 'regression' | 'LogisticRegression' }
    rule naive-bayes-classifier-name { 'naive' 'bayes' | 'NaiveBayes' }
    rule nearest-neighbors-classifier-name { 'nearest' 'neighbors' | 'NearestNeighbors' }
    rule neural-network-classifier-name { 'neural' 'network' | 'NeuralNetwork' }
    rule random-forest-classifier-name { 'random' 'forest' | 'RandomForest' }
    rule support-vector-machine-classifier-name { 'support' 'vector' 'machine' | 'SupportVectorMachine' }

}
