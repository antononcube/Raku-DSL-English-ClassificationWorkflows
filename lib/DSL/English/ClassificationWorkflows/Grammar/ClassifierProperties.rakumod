use DSL::Shared::Utilities::FuzzyMatching;

role DSL::English::ClassificationWorkflows::Grammar::ClassifierProperties {

    rule wl-classifier-info-property {
        <acceptance-threshold-prop> |
        <accuracy-prop> |
        <anomaly-detector-prop> |
        <batch-evaluation-speed-prop> |
        <batch-evaluation-time-prop> |
        <classes-prop> |
        <class-number-prop> |
        <class-priors-prop> |
        <evaluation-time-prop> |
        <example-number-prop> |
        <feature-names-prop> |
        <feature-number-prop> |
        <feature-types-prop> |
        <function-prop> |
        <function-memory-prop> |
        <function-properties-prop> |
        <indeterminate-threshold-prop> |
        <l1-regularization-prop> |
        <l2-regularization-prop> |
        <learning-curve-prop> |
        <max-training-memory-prop> |
        <mean-cross-entropy-prop> |
        <method-prop> |
        <method-description-prop> |
        <method-option-prop> |
        <optimization-method-prop> |
        <performance-goal-prop> |
        <probabilities-function-prop> |
        <properties-prop> |
        <training-class-priors-prop> |
        <training-time-prop> |
        <utility-function-prop>}

    rule acceptance-threshold-prop {<acceptance-prop-word> <threshold-prop-word> | 'AcceptanceThreshold'}
    rule accuracy-prop {<accuracy-prop-word> | 'Accuracy'}
    rule anomaly-detector-prop {<anomaly-prop-word> <detector-prop-word> | 'AnomalyDetector'}
    rule batch-evaluation-speed-prop {<batch-prop-word> <evaluation-prop-word> <speed-prop-word> | 'BatchEvaluationSpeed'}
    rule batch-evaluation-time-prop {<batch-prop-word> <evaluation-prop-word> <time-prop-word> | 'BatchEvaluationTime'}
    rule classes-prop {<classes-prop-word> | 'Classes'}
    rule class-number-prop {<class-prop-word> <number-prop-word> | 'ClassNumber'}
    rule class-priors-prop {<class-prop-word> <priors-prop-word> | 'ClassPriors'}
    rule evaluation-time-prop {<evaluation-prop-word> <time-prop-word> | 'EvaluationTime'}
    rule example-number-prop {<example-prop-word> <number-prop-word> | 'ExampleNumber'}
    rule feature-names-prop {<feature-prop-word> <names-prop-word> | 'FeatureNames'}
    rule feature-number-prop {<feature-prop-word> <number-prop-word> | 'FeatureNumber'}
    rule feature-types-prop {<feature-prop-word> <types-prop-word> | 'FeatureTypes'}
    rule function-prop {<function-prop-word> | 'Function'}
    rule function-memory-prop {<function-prop-word> <memory-prop-word> | 'FunctionMemory'}
    rule function-properties-prop {<function-prop-word> <properties-prop-word> | 'FunctionProperties'}
    rule indeterminate-threshold-prop {<indeterminate-prop-word> <threshold-prop-word> | 'IndeterminateThreshold'}
    rule l1-regularization-prop {<l1-prop-word> <regularization-prop-word> | 'L1Regularization'}
    rule l2-regularization-prop {<l2-prop-word> <regularization-prop-word> | 'L2Regularization'}
    rule learning-curve-prop {<learning-prop-word> <curve-prop-word> | 'LearningCurve'}
    rule max-training-memory-prop {<max-prop-word> <training-prop-word> <memory-prop-word> | 'MaxTrainingMemory'}
    rule mean-cross-entropy-prop {<mean-prop-word> <cross-prop-word> <entropy-prop-word> | 'MeanCrossEntropy'}
    rule method-prop {<method-prop-word> | 'Method'}
    rule method-description-prop {<method-prop-word> <description-prop-word> | 'MethodDescription'}
    rule method-option-prop {<method-prop-word> <option-prop-word> | 'MethodOption'}
    rule optimization-method-prop {<optimization-prop-word> <method-prop-word> | 'OptimizationMethod'}
    rule performance-goal-prop {<performance-prop-word> <goal-prop-word> | 'PerformanceGoal'}
    rule probabilities-function-prop {<probabilities-prop-word> <function-prop-word> | 'ProbabilitiesFunction'}
    rule properties-prop {<properties-prop-word> | 'Properties'}
    rule training-class-priors-prop {<training-prop-word> <class-prop-word> <priors-prop-word> | 'TrainingClassPriors'}
    rule training-time-prop {<training-prop-word> <time-prop-word> | 'TrainingTime'}
    rule utility-function-prop {<utility-prop-word> <function-prop-word> | 'UtilityFunction'}

    token acceptance-prop-word { 'acceptance' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'acceptance') }> }
    token accuracy-prop-word { 'accuracy' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'accuracy') }> }
    token anomaly-prop-word { 'anomaly' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'anomaly') }> }
    token batch-prop-word { 'batch' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'batch') }> }
    token class-prop-word { 'class' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'class') }> }
    token classes-prop-word { 'classes' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'classes') }> }
    token cross-prop-word { 'cross' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'cross') }> }
    token curve-prop-word { 'curve' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'curve') }> }
    token description-prop-word { 'description' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'description') }> }
    token detector-prop-word { 'detector' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'detector') }> }
    token entropy-prop-word { 'entropy' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'entropy') }> }
    token evaluation-prop-word { 'evaluation' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'evaluation') }> }
    token example-prop-word { 'example' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'example') }> }
    token feature-prop-word { 'feature' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'feature') }> }
    token function-prop-word { 'function' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'function') }> }
    token goal-prop-word { 'goal' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'goal') }> }
    token indeterminate-prop-word { 'indeterminate' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'indeterminate') }> }
    token l1-prop-word { 'l1' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'l1') }> }
    token l2-prop-word { 'l2' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'l2') }> }
    token learning-prop-word { 'learning' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'learning') }> }
    token max-prop-word { 'max' }
    token mean-prop-word { 'mean' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'mean') }> }
    token memory-prop-word { 'memory' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'memory') }> }
    token method-prop-word { 'method' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'method') }> }
    token names-prop-word { 'names' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'names') }> }
    token number-prop-word { 'number' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'number') }> }
    token optimization-prop-word { 'optimization' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'optimization') }> }
    token option-prop-word { 'option' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'option') }> }
    token performance-prop-word { 'performance' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'performance') }> }
    token priors-prop-word { 'priors' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'priors') }> }
    token probabilities-prop-word { 'probabilities' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'probabilities') }> }
    token properties-prop-word { 'properties' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'properties') }> }
    token regularization-prop-word { 'regularization' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'regularization') }> }
    token speed-prop-word { 'speed' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'speed') }> }
    token threshold-prop-word { 'threshold' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'threshold') }> }
    token time-prop-word { 'time' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'time') }> }
    token training-prop-word { 'training' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'training') }> }
    token types-prop-word { 'types' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'types') }> }
    token utility-prop-word { 'utility' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'utility') }> }
}
