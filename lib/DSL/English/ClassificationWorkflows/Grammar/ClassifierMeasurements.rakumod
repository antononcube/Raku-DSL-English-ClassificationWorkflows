
role DSL::English::ClassificationWorkflows::Grammar::ClassifierMeasurements {
    rule wl-classifier-measurements {
        <accuracy-measure> |
        <accuracy-baseline-measure> |
        <accuracy-rejection-plot-measure> |
        <area-under-curve-measure> |
        <batch-evaluation-time-measure> |
        <best-classified-examples-measure> |
        <classic-reliability-diagram-measure> |
        <classifier-function-measure> |
        <class-mean-cross-entropy-measure> |
        <class-rejection-rate-measure> |
        <cohen-kappa-measure> |
        <confusion-distribution-measure> |
        <confusion-function-measure> |
        <confusion-matrix-measure> |
        <confusion-matrix-plot-measure> |
        <correctly-classified-examples-measure> |
        <decision-utilities-measure> |
        <error-measure> |
        <evaluation-time-measure> |
        <examples-measure> |
        <f1-score-measure> |
        <false-discovery-rate-measure> |
        <false-negative-examples-measure> |
        <false-negative-number-measure> |
        <false-negative-rate-measure> |
        <false-positive-examples-measure> |
        <false-positive-number-measure> |
        <false-positive-rate-measure> |
        <geometric-mean-probability-measure> |
        <indeterminate-examples-measure> |
        <least-certain-examples-measure> |
        <likelihood-measure> |
        <log-likelihood-measure> |
        <matthews-correlation-coefficient-measure> |
        <mean-cross-entropy-measure> |
        <mean-decision-utility-measure> |
        <misclassified-examples-measure> |
        <most-certain-examples-measure> |
        <negative-predictive-value-measure> |
        <perplexity-measure> |
        <precision-measure> |
        <probabilities-measure> |
        <probability-histogram-measure> |
        <properties-measure> |
        <recall-measure> |
        <rejection-rate-measure> |
        <reliability-data-measure> |
        <reliability-diagram-measure> |
        <report-measure> |
        <curve-measure> |
        <scott-pi-measure> |
        <specificity-measure> |
        <top-confusions-measure> |
        <true-negative-examples-measure> |
        <true-negative-number-measure> |
        <true-positive-examples-measure> |
        <true-positive-number-measure> |
        <worst-classified-examples-measure>}
    rule accuracy-measure {'accuracy' | 'Accuracy'}
    rule accuracy-baseline-measure {'accuracy' 'baseline' | 'AccuracyBaseline'}
    rule accuracy-rejection-plot-measure {'accuracy' 'rejection' 'plot' | 'AccuracyRejectionPlot'}
    rule area-under-curve-measure {'area' 'under' 'curve' | 'AreaUnderROCCurve'}
    rule batch-evaluation-time-measure {'batch' 'evaluation' 'time' | 'BatchEvaluationTime'}
    rule best-classified-examples-measure {'best' 'classified' 'examples' | 'BestClassifiedExamples'}
    rule classic-reliability-diagram-measure {'classic' 'reliability' 'diagram' | 'ClassicReliabilityDiagram'}
    rule classifier-function-measure {'classifier' 'function' | 'ClassifierFunction'}
    rule class-mean-cross-entropy-measure {'class' 'mean' 'cross' 'entropy' | 'ClassMeanCrossEntropy'}
    rule class-rejection-rate-measure {'class' 'rejection' 'rate' | 'ClassRejectionRate'}
    rule cohen-kappa-measure {'cohen' 'kappa' | 'CohenKappa'}
    rule confusion-distribution-measure {'confusion' 'distribution' | 'ConfusionDistribution'}
    rule confusion-function-measure {'confusion' 'function' | 'ConfusionFunction'}
    rule confusion-matrix-measure {'confusion' 'matrix' | 'ConfusionMatrix'}
    rule confusion-matrix-plot-measure {'confusion' 'matrix' 'plot' | 'ConfusionMatrixPlot'}
    rule correctly-classified-examples-measure {'correctly' 'classified' 'examples' | 'CorrectlyClassifiedExamples'}
    rule decision-utilities-measure {'decision' 'utilities' | 'DecisionUtilities'}
    rule error-measure {'error' | 'Error'}
    rule evaluation-time-measure {'evaluation' 'time' | 'EvaluationTime'}
    rule examples-measure {'examples' | 'Examples'}
    rule f1-score-measure {'f1' 'score' | 'F1Score'}
    rule false-discovery-rate-measure {'false' 'discovery' 'rate' | 'FalseDiscoveryRate'}
    rule false-negative-examples-measure {'false' 'negative' 'examples' | 'FalseNegativeExamples'}
    rule false-negative-number-measure {'false' 'negative' 'number' | 'FalseNegativeNumber'}
    rule false-negative-rate-measure {'false' 'negative' 'rate' | 'FalseNegativeRate'}
    rule false-positive-examples-measure {'false' 'positive' 'examples' | 'FalsePositiveExamples'}
    rule false-positive-number-measure {'false' 'positive' 'number' | 'FalsePositiveNumber'}
    rule false-positive-rate-measure {'false' 'positive' 'rate' | 'FalsePositiveRate'}
    rule geometric-mean-probability-measure {'geometric' 'mean' 'probability' | 'GeometricMeanProbability'}
    rule indeterminate-examples-measure {'indeterminate' 'examples' | 'IndeterminateExamples'}
    rule least-certain-examples-measure {'least' 'certain' 'examples' | 'LeastCertainExamples'}
    rule likelihood-measure {'likelihood' | 'Likelihood'}
    rule log-likelihood-measure {'log' 'likelihood' | 'LogLikelihood'}
    rule matthews-correlation-coefficient-measure {'matthews' 'correlation' 'coefficient' | 'MatthewsCorrelationCoefficient'}
    rule mean-cross-entropy-measure {'mean' 'cross' 'entropy' | 'MeanCrossEntropy'}
    rule mean-decision-utility-measure {'mean' 'decision' 'utility' | 'MeanDecisionUtility'}
    rule misclassified-examples-measure {'misclassified' 'examples' | 'MisclassifiedExamples'}
    rule most-certain-examples-measure {'most' 'certain' 'examples' | 'MostCertainExamples'}
    rule negative-predictive-value-measure {'negative' 'predictive' 'value' | 'NegativePredictiveValue'}
    rule perplexity-measure {'perplexity' | 'Perplexity'}
    rule precision-measure {'precision' | 'Precision'}
    rule probabilities-measure {'probabilities' | 'Probabilities'}
    rule probability-histogram-measure {'probability' 'histogram' | 'ProbabilityHistogram'}
    rule properties-measure {'properties' | 'Properties'}
    rule recall-measure {'recall' | 'Recall'}
    rule rejection-rate-measure {'rejection' 'rate' | 'RejectionRate'}
    rule reliability-data-measure {'reliability' 'data' | 'ReliabilityData'}
    rule reliability-diagram-measure {'reliability' 'diagram' | 'ReliabilityDiagram'}
    rule report-measure {'report' | 'Report'}
    rule curve-measure {'curve' | 'ROCCurve'}
    rule scott-pi-measure {'scott' 'pi' | 'ScottPi'}
    rule specificity-measure {'specificity' | 'Specificity'}
    rule top-confusions-measure {'top' 'confusions' | 'TopConfusions'}
    rule true-negative-examples-measure {'true' 'negative' 'examples' | 'TrueNegativeExamples'}
    rule true-negative-number-measure {'true' 'negative' 'number' | 'TrueNegativeNumber'}
    rule true-positive-examples-measure {'true' 'positive' 'examples' | 'TruePositiveExamples'}
    rule true-positive-number-measure {'true' 'positive' 'number' | 'TruePositiveNumber'}
    rule worst-classified-examples-measure {'worst' 'classified' 'examples' | 'WorstClassifiedExamples'}
}