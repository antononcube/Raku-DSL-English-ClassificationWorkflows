use v6;

use DSL::Shared::Roles::English::CommonParts;
use DSL::Shared::Utilities::FuzzyMatching;

# Data query specific phrases
role DSL::English::ClassificationWorkflows::Grammar::ClassificationPhrases
        does DSL::Shared::Roles::English::CommonParts {
    # Tokens
    token characteristic-noun { 'characteristic' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'characteristic') }> }
    token class-noun { 'class' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'class') }> }
    token classifier-noun { 'classifier' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'classifier') }> }
    token ensemble-noun { 'ensemble' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'ensemble') }> }
    token fraction-noun { 'fraction' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'fraction') }> }
    token info-noun { 'info' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'info') }> }
    token information-noun { 'information' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'information') }> }
    token label-noun { 'label' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'label') }> }
    token measurements-noun { 'measurements' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'measurements') }> }
    token operating-adjective { 'operating' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'operating') }> }
    token proportional-adjective { 'proportional' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'proportional') }> }
    token random-adjective { 'random' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'random') }> }
    token receiver-noun { 'receiver' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'receiver') }> }
    token reduce-verb { 'reduces' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'reduces') }> }
    token roc-noun { 'roc' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'roc') }> }
    token split-directive { 'split' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'split') }> | 'divide' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'divide') }> | 'partition' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'partition') }> }
    token split-verb { 'split' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'split') }> }
    token testing-adjective { 'testing' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'testing') }> }
    token training-adjective { 'training' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'training') }> }
    token validation-adjective { 'validation' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'validation') }> }

    # Rules
    rule classifier-ensemble-phrase { <classifier-noun> <ensemble-noun> }
    rule classifier-info-phrase { <classifier-noun> [ <info-noun> | <information-noun> ] }
    rule reduce-dimension-phrase { <reduce-verb> <dimension> }
    rule roc-phrase { <receiver-noun> <operating-adjective> <characteristic-noun> | <roc-noun> }

    # WL classifier names
    rule wl-classifier-name {
        <decision-tree-classifier-name> |
        <gradient-boosted-trees-classifier-name> |
        <logistic-regression-classifier-name> |
        <nearest-neighbors-classifier-name> |
        <neural-network-classifier-name> |
        <support-vector-machine-classifier-name> }
    rule decision-tree-classifier-name { 'decision' 'tree' | 'DecisionTree' }
    rule gradient-boosted-trees-classifier-name { 'gradient' 'boosted' 'trees' | 'GradientBoostedTrees' }
    rule logistic-regression-classifier-name { 'logistic' 'regression' | 'LogisticRegression' }
    rule nearest-neighbors-classifier-name { 'nearest' 'neighbors' | 'NearestNeighbors' }
    rule neural-network-classifier-name { 'neural' 'network' | 'NeuralNetwork' }
    rule support-vector-machine-classifier-name { 'support' 'vector' 'machine' | 'SupportVectorMachine' }
}
