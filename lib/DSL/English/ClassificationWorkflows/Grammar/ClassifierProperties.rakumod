use v6;

role DSL::English::ClassificationWorkflows::Grammar::ClassifierProperties {
    rule wl-classifier-info-property {
        <acceptance-threshold-prop>    |
        <accuracy-prop>    |
        <anomaly-detector-prop>    |
        <batch-evaluation-speed-prop>    |
        <batch-evaluation-time-prop>    |
        <classes-prop>    |
        <class-number-prop>    |
        <class-priors-prop>    |
        <distribution-smoothing-prop>    |
        <evaluation-time-prop>    |
        <example-number-prop>    |
        <feature-names-prop>    |
        <feature-number-prop>    |
        <feature-types-prop>    |
        <function-memory-prop>    |
        <function-properties-prop>    |
        <indeterminate-threshold-prop>    |
        <learning-curve-prop>    |
        <max-training-memory-prop>    |
        <mean-cross-entropy-prop>    |
        <method-prop>    |
        <method-description-prop>    |
        <method-option-prop>    |
        <nearest-method-prop>    |
        <neighbors-number-prop>    |
        <performance-goal-prop>    |
        <properties-prop>    |
        <training-class-priors-prop>    |
        <training-time-prop>    |
        <utility-function-prop>
    }
    rule acceptance-threshold-prop {
        'acceptance' 'threshold'    | 'AcceptanceThreshold'
    }
    rule accuracy-prop {
        'accuracy'    | 'Accuracy'
    }
    rule anomaly-detector-prop {
        'anomaly' 'detector'    | 'AnomalyDetector'
    }
    rule batch-evaluation-speed-prop {
        'batch' 'evaluation' 'speed'    | 'BatchEvaluationSpeed'
    }
    rule batch-evaluation-time-prop {
        'batch' 'evaluation' 'time'    | 'BatchEvaluationTime'
    }
    rule classes-prop {
        'classes'    | 'Classes'
    }
    rule class-number-prop {
        'class' 'number'    | 'ClassNumber'
    }
    rule class-priors-prop {
        'class' 'priors'    | 'ClassPriors'
    }
    rule distribution-smoothing-prop {
        'distribution' 'smoothing'    | 'DistributionSmoothing'
    }
    rule evaluation-time-prop {
        'evaluation' 'time'    | 'EvaluationTime'
    }
    rule example-number-prop {
        'example' 'number'    | 'ExampleNumber'
    }
    rule feature-names-prop {
        'feature' 'names'    | 'FeatureNames'
    }
    rule feature-number-prop {
        'feature' 'number'    | 'FeatureNumber'
    }
    rule feature-types-prop {
        'feature' 'types'    | 'FeatureTypes'
    }
    rule function-memory-prop {
        'function' 'memory'    | 'FunctionMemory'
    }
    rule function-properties-prop {
        'function' 'properties'    | 'FunctionProperties'
    }
    rule indeterminate-threshold-prop {
        'indeterminate' 'threshold'    | 'IndeterminateThreshold'
    }
    rule learning-curve-prop {
        'learning' 'curve'    | 'LearningCurve'
    }
    rule max-training-memory-prop {
        'max' 'training' 'memory'    | 'MaxTrainingMemory'
    }
    rule mean-cross-entropy-prop {
        'mean' 'cross' 'entropy'    | 'MeanCrossEntropy'
    }
    rule method-prop {
        'method'    | 'Method'
    }
    rule method-description-prop {
        'method' 'description'    | 'MethodDescription'
    }
    rule method-option-prop {
        'method' 'option'    | 'MethodOption'
    }
    rule nearest-method-prop {
        'nearest' 'method'    | 'NearestMethod'
    }
    rule neighbors-number-prop {
        'neighbors' 'number'    | 'NeighborsNumber'
    }
    rule performance-goal-prop {
        'performance' 'goal'    | 'PerformanceGoal'
    }
    rule properties-prop {
        'properties'    | 'Properties'
    }
    rule training-class-priors-prop {
        'training' 'class' 'priors'    | 'TrainingClassPriors'
    }
    rule training-time-prop {
        'training' 'time'    | 'TrainingTime'
    }
    rule utility-function-prop {
        'utility' 'function'    | 'UtilityFunction'
    }
}

