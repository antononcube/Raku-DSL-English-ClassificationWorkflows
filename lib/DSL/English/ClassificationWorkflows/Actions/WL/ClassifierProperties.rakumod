class DSL::English::ClassificationWorkflows::Actions::WL::ClassifierProperties {

    method wl-classifier-info-property($/) { make '"' ~ $/.values[0].made ~ '"'; }

    method acceptance-threshold-prop($/) { make 'AcceptanceThreshold' }
    method accuracy-prop($/) { make 'Accuracy' }
    method anomaly-detector-prop($/) { make 'AnomalyDetector' }
    method batch-evaluation-speed-prop($/) { make 'BatchEvaluationSpeed' }
    method batch-evaluation-time-prop($/) { make 'BatchEvaluationTime' }
    method classes-prop($/) { make 'Classes' }
    method class-number-prop($/) { make 'ClassNumber' }
    method class-priors-prop($/) { make 'ClassPriors' }
    method distribution-smoothing-prop($/) { make 'DistributionSmoothing' }
    method evaluation-time-prop($/) { make 'EvaluationTime' }
    method example-number-prop($/) { make 'ExampleNumber' }
    method feature-names-prop($/) { make 'FeatureNames' }
    method feature-number-prop($/) { make 'FeatureNumber' }
    method feature-types-prop($/) { make 'FeatureTypes' }
    method function-memory-prop($/) { make 'FunctionMemory' }
    method function-properties-prop($/) { make 'FunctionProperties' }
    method indeterminate-threshold-prop($/) { make 'IndeterminateThreshold' }
    method learning-curve-prop($/) { make 'LearningCurve' }
    method max-training-memory-prop($/) { make 'MaxTrainingMemory' }
    method mean-cross-entropy-prop($/) { make 'MeanCrossEntropy' }
    method method-prop($/) { make 'Method' }
    method method-description-prop($/) { make 'MethodDescription' }
    method method-option-prop($/) { make 'MethodOption' }
    method nearest-method-prop($/) { make 'NearestMethod' }
    method neighbors-number-prop($/) { make 'NeighborsNumber' }
    method performance-goal-prop($/) { make 'PerformanceGoal' }
    method properties-prop($/) { make 'Properties' }
    method training-class-priors-prop($/) { make 'TrainingClassPriors' }
    method training-time-prop($/) { make 'TrainingTime' }
    method utility-function-prop($/) { make 'UtilityFunction' }
}
