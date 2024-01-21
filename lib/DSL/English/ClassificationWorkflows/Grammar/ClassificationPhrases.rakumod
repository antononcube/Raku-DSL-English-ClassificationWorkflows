use DSL::Shared::Roles::English::PipelineCommand;
use DSL::Shared::Utilities::FuzzyMatching;

# Data query specific phrases
role DSL::English::ClassificationWorkflows::Grammar::ClassificationPhrases
        does DSL::Shared::Roles::English::PipelineCommand {
    # Tokens

    proto token accuracy-noun {*}
    token accuracy-noun:sym<English> { :i 'accuracy' | ([\w]+) <?{ is-fuzzy-match($0.Str, 'accuracy', 2) }> }

    proto token accuracies-noun {*}
    token accuracies-noun:sym<English> { :i 'accuracies' | ([\w]+) <?{ is-fuzzy-match($0.Str, 'accuracies', 2) }> }

    proto token available-adjective {*}
    token available-adjective:sym<English> { :i 'available' | ([\w]+) <?{ is-fuzzy-match($0.Str, 'available', 2) }> }

    proto token characteristic-noun {*}
    token characteristic-noun:sym<English> { :i 'characteristic' | ([\w]+) <?{ $0.Str ne 'characteristics' and is-fuzzy-match($0.Str, 'characteristic', 2) }> }

    proto token characteristics-noun {*}
    token characteristics-noun:sym<English> { :i 'characteristics' | ([\w]+) <?{ $0.Str ne 'characteristic' and is-fuzzy-match($0.Str, 'characteristics', 2) }> }

    proto token class-adjective {*}
    token class-adjective:sym<English> { :i <class-noun> }

    proto token class-noun {*}
    token class-noun:sym<English> { :i 'class' | ([\w]+) <?{ $0.Str ne 'classes' and is-fuzzy-match($0.Str, 'class', 2) }> }

    proto token classes-noun {*}
    token classes-noun:sym<English> { :i 'classes' | ([\w]+) <?{ $0.Str ne 'class' and is-fuzzy-match($0.Str, 'classes', 2) }> }

    proto token classification-noun {*}
    token classification-noun:sym<English> { :i 'classification' | ([\w]+) <?{ is-fuzzy-match($0.Str, 'classification', 2) }> }

    proto token classifier-adjective {*}
    token classifier-adjective:sym<English> { :i <classifier-noun> }

    proto token classifier-noun {*}
    token classifier-noun:sym<English> { :i 'classifier' | ([\w]+) <?{ $0.Str ne 'classifiers' and is-fuzzy-match($0.Str, 'classifier', 2) }> }

    proto token classifiers-noun {*}
    token classifiers-noun:sym<English> { :i 'classifiers' | ([\w]+) <?{ $0.Str ne 'classifier' and is-fuzzy-match($0.Str, 'classifiers', 2) }> }

    proto token curve-noun {*}
    token curve-noun:sym<English> { :i 'curve' | ([\w]+) <?{ $0.Str ne 'curves' and is-fuzzy-match($0.Str, 'curve', 2) }> }

    proto token curves-noun {*}
    token curves-noun:sym<English> { :i 'curves' | ([\w]+) <?{ $0.Str ne 'curve' and is-fuzzy-match($0.Str, 'curves', 2) }> }

    proto token ensemble-noun {*}
    token ensemble-noun:sym<English> { :i 'ensemble' | ([\w]+) <?{ is-fuzzy-match($0.Str, 'ensemble', 2) }> }

    proto token estimates-noun {*}
    token estimates-noun:sym<English> { :i 'estimates' | ([\w]+) <?{ is-fuzzy-match($0.Str, 'estimates', 2) }> }

    proto token fraction-noun {*}
    token fraction-noun:sym<English> { :i 'fraction' | ([\w]+) <?{ is-fuzzy-match($0.Str, 'fraction', 2) }> }

    proto token importance-noun {*}
    token importance-noun:sym<English> { :i 'importance' | ([\w]+) <?{ is-fuzzy-match($0.Str, 'importance', 2) }> }

    proto token info-noun {*}
    token info-noun:sym<English> { :i 'info' | ([\w]+) <?{ is-fuzzy-match($0.Str, 'info', 2) }> }

    proto token information-noun {*}
    token information-noun:sym<English> { :i 'information' | ([\w]+) <?{ is-fuzzy-match($0.Str, 'information', 2) }> }

    proto token label-noun {*}
    token label-noun:sym<English> { :i 'label' | ([\w]+) <?{ is-fuzzy-match($0.Str, 'label', 2) }> }

    proto token line-noun {*}
    token line-noun:sym<English> { :i 'line' | ([\w]+) <?{ is-fuzzy-match($0.Str, 'line', 2) }> }

    proto token measurement-noun {*}
    token measurement-noun:sym<English> { :i 'measurement' | ([\w]+) <?{ $0.Str ne 'measurements' and is-fuzzy-match($0.Str, 'measurement', 2) }> }

    proto token measurements-noun {*}
    token measurements-noun:sym<English> { :i 'measurements' | ([\w]+) <?{ $0.Str ne 'measurement' and is-fuzzy-match($0.Str, 'measurements', 2) }> }

    proto token operating-adjective {*}
    token operating-adjective:sym<English> { :i 'operating' | ([\w]+) <?{ is-fuzzy-match($0.Str, 'operating', 2) }> }

    proto token proportional-adjective {*}
    token proportional-adjective:sym<English> { :i 'proportional' | ([\w]+) <?{ is-fuzzy-match($0.Str, 'proportional', 2) }> }

    proto token ratio-noun {*}
    token ratio-noun:sym<English> { :i 'ratio' | ([\w]+) <?{ is-fuzzy-match($0.Str, 'ratio', 2) }> }

    proto token receiver-noun {*}
    token receiver-noun:sym<English> { :i 'receiver' | ([\w]+) <?{ is-fuzzy-match($0.Str, 'receiver', 2) }> }

    proto token resampling-noun {*}
    token resampling-noun:sym<English> { :i 'resampling' | ([\w]+) <?{ is-fuzzy-match($0.Str, 'resampling', 2) }> }

    proto token roc-noun {*}
    token roc-noun:sym<English> { :i 'roc' | ([\w]+) <?{ $0.Str ne 'rocs' and is-fuzzy-match($0.Str, 'roc', 1) }> }

    proto token rocs-noun {*}
    token rocs-noun:sym<English> { :i 'rocs' | ([\w]+) <?{ $0.Str ne 'roc' and is-fuzzy-match($0.Str, 'rocs', 2) }> }

    proto token shuffling-noun {*}
    token shuffling-noun:sym<English> { :i 'shuffling' | ([\w]+) <?{ is-fuzzy-match($0.Str, 'shuffling', 2) }> }

    proto token split-adjective {*}
    token split-adjective:sym<English> { :i <split-verb> }

    proto token split-directive {*}
    token split-directive:sym<English> { :i  'split' | 'divide' | 'partition'  }

    proto token test-verb {*}
    token test-verb:sym<English> { :i 'test' | ([\w]+) <?{ is-fuzzy-match($0.Str, 'test', 2) }> }

    proto token testing-adjective {*}
    token testing-adjective:sym<English> { :i 'testing' | ([\w]+) <?{ is-fuzzy-match($0.Str, 'testing', 2) }> }

    proto token train-verb {*}
    token train-verb:sym<English> { :i 'train' | ([\w]+) <?{ is-fuzzy-match($0.Str, 'train', 2) }> }

    proto token training-adjective {*}
    token training-adjective:sym<English> { :i 'training' | ([\w]+) <?{ is-fuzzy-match($0.Str, 'training', 2) }> }

    proto token validation-adjective {*}
    token validation-adjective:sym<English> { :i 'validation' | ([\w]+) <?{ is-fuzzy-match($0.Str, 'validation', 2) }> }

    # Rules

    proto rule class-label-phrase {*}
    rule class-label-phrase:sym<English> {  <class-adjective> <label-noun>? | <label-noun>  }

    proto rule classifier-ensemble-phrase {*}
    rule classifier-ensemble-phrase:sym<English> {  [ <classifier-adjective>? <ensemble-noun> ] | <ensemble-noun> [ <of-preposition>? <classifiers-noun> | <classifier-noun> ]  }

    proto rule classifier-info-phrase {*}
    rule classifier-info-phrase:sym<English> {  <classifier-adjective> [ <info-noun> | <information-noun> ]  }

    proto rule classifier-object-phrase {*}
    rule classifier-object-phrase:sym<English> {  <classifier-adjective>? <object-noun>  }

    proto rule reduce-dimension-phrase {*}
    rule reduce-dimension-phrase:sym<English> {  <reduce-verb> <dimension-noun>  }

    proto rule roc-phrase {*}
    rule roc-phrase:sym<English> {  <receiver-noun> <operating-adjective> <characteristic-noun> | <roc-noun>  }

    proto rule rocs-phrase {*}
    rule rocs-phrase:sym<English> {  <receiver-noun> <operating-adjective> <characteristics-noun> | <rocs-noun>  }

    proto rule roc-curve-phrase {*}
    rule roc-curve-phrase:sym<English> {  [ <roc-phrase> | <rocs-phrase> ] [ <curve-noun> | <curves-noun> | <plot-noun> | <plots-noun> ]?  }

    # WL classifier names

    proto rule wl-classifier-name {*}
    rule wl-classifier-name:sym<English> {  <decision-tree-classifier-name> | <gradient-boosted-trees-classifier-name> | <logistic-regression-classifier-name> | <naive-bayes-classifier-name> | <nearest-neighbors-classifier-name> | <neural-network-classifier-name> | <random-forest-classifier-name> | <support-vector-machine-classifier-name>  }

    proto rule decision-tree-classifier-name {*}
    rule decision-tree-classifier-name:sym<English> {  'decision' 'tree' | 'DecisionTree'  }

    proto rule gradient-boosted-trees-classifier-name {*}
    rule gradient-boosted-trees-classifier-name:sym<English> {  'gradient' 'boosted' 'trees' | 'GradientBoostedTrees'  }

    proto rule logistic-regression-classifier-name {*}
    rule logistic-regression-classifier-name:sym<English> {  'logistic' 'regression' | 'LogisticRegression'  }

    proto rule naive-bayes-classifier-name {*}
    rule naive-bayes-classifier-name:sym<English> {  'naive' 'bayes' | 'NaiveBayes'  }

    proto rule nearest-neighbors-classifier-name {*}
    rule nearest-neighbors-classifier-name:sym<English> {  'nearest' 'neighbors' | 'NearestNeighbors'  }

    proto rule neural-network-classifier-name {*}
    rule neural-network-classifier-name:sym<English> {  'neural' 'network' | 'NeuralNetwork'  }

    proto rule random-forest-classifier-name {*}
    rule random-forest-classifier-name:sym<English> {  'random' 'forest' | 'RandomForest'  }

    proto rule support-vector-machine-classifier-name {*}
    rule support-vector-machine-classifier-name:sym<English> {  'support' 'vector' 'machine' | 'SupportVectorMachine'  }
}

