role DSL::English::ClassificationWorkflows::Grammar::ClassifierMeasurements {

    rule wl-classifier-measurement {
        <accuracy-measure>    |
        <accuracy-baseline-measure>    |
        <accuracy-rejection-plot-measure>    |
        <area-under-curve-measure>    |
        <batch-evaluation-time-measure>    |
        <best-classified-examples-measure>    |
        <classic-reliability-diagram-measure>    |
        <classifier-function-measure>    |
        <class-mean-cross-entropy-measure>    |
        <class-rejection-rate-measure>    |
        <cohen-kappa-measure>    |
        <confusion-distribution-measure>    |
        <confusion-function-measure>    |
        <confusion-matrix-plot-measure>    |
        <confusion-matrix-measure>    |
        <correctly-classified-examples-measure>    |
        <decision-utilities-measure>    |
        <error-measure>    |
        <evaluation-time-measure>    |
        <examples-measure>    |
        <f1-score-measure>    |
        <false-discovery-rate-measure>    |
        <false-negative-examples-measure>    |
        <false-negative-number-measure>    |
        <false-negative-rate-measure>    |
        <false-positive-examples-measure>    |
        <false-positive-number-measure>    |
        <false-positive-rate-measure>    |
        <geometric-mean-probability-measure>    |
        <indeterminate-examples-measure>    |
        <least-certain-examples-measure>    |
        <likelihood-measure>    |
        <log-likelihood-measure>    |
        <matthews-correlation-coefficient-measure>    |
        <mean-cross-entropy-measure>    |
        <mean-decision-utility-measure>    |
        <misclassified-examples-measure>    |
        <most-certain-examples-measure>    |
        <negative-predictive-value-measure>    |
        <perplexity-measure>    |
        <precision-measure>    |
        <probabilities-measure>    |
        <probability-histogram-measure>    |
        <properties-measure>    |
        <recall-measure>    |
        <rejection-rate-measure>    |
        <reliability-data-measure>    |
        <reliability-diagram-measure>    |
        <report-measure>    |
        <curve-measure>    |
        <scott-pi-measure>    |
        <specificity-measure>    |
        <top-confusions-measure>    |
        <true-negative-examples-measure>    |
        <true-negative-number-measure>    |
        <true-positive-examples-measure>    |
        <true-positive-number-measure>    |
        <worst-classified-examples-measure>
    }
    rule accuracy-measure {
        <accuracy-word>    | 'Accuracy'
    }
    rule accuracy-baseline-measure {
        <accuracy-word> <baseline-word>    | 'AccuracyBaseline'
    }
    rule accuracy-rejection-plot-measure {
        <accuracy-word> <rejection-word> <plot-word>    | 'AccuracyRejectionPlot'
    }
    rule area-under-curve-measure {
        <area-word> <under-word> <curve-word> | 'AreaUnderROCCurve'
    }
    rule batch-evaluation-time-measure {
        <batch-word> <evaluation-word> <time-word>    | 'BatchEvaluationTime'
    }
    rule best-classified-examples-measure {
        <best-word> <classified-word> <examples-word>    | 'BestClassifiedExamples'
    }
    rule classic-reliability-diagram-measure {
        <classic-word> <reliability-word> <diagram-word>    | 'ClassicReliabilityDiagram'
    }
    rule classifier-function-measure {
        <classifier-word> <function-word>    | 'ClassifierFunction'
    }
    rule class-mean-cross-entropy-measure {
        <class-word> <mean-word> <cross-word> <entropy-word>    | 'ClassMeanCrossEntropy'
    }
    rule class-rejection-rate-measure {
        <class-word> <rejection-word> <rate-word>    | 'ClassRejectionRate'
    }
    rule cohen-kappa-measure {
        <cohen-word> <kappa-word>    | 'CohenKappa'
    }
    rule confusion-distribution-measure {
        <confusion-word> <distribution-word>    | 'ConfusionDistribution'
    }
    rule confusion-function-measure {
        <confusion-word> <function-word>    | 'ConfusionFunction'
    }
    rule confusion-matrix-measure {
        <confusion-word> <matrix-word>    | 'ConfusionMatrix'
    }
    rule confusion-matrix-plot-measure {
        <confusion-word> <matrix-word> <plot-word>    | 'ConfusionMatrixPlot'
    }
    rule correctly-classified-examples-measure {
        <correctly-word> <classified-word> <examples-word>    | 'CorrectlyClassifiedExamples'
    }
    rule decision-utilities-measure {
        <decision-word> <utilities-word>    | 'DecisionUtilities'
    }
    rule error-measure {
        <error-word>    | 'Error'
    }
    rule evaluation-time-measure {
        <evaluation-word> <time-word>    | 'EvaluationTime'
    }
    rule examples-measure {
        <examples-word>    | 'Examples'
    }
    rule f1-score-measure {
        <f1-word> <score-word>    | 'F1Score'
    }
    rule false-discovery-rate-measure {
        <false-word> <discovery-word> <rate-word>    | 'FalseDiscoveryRate'
    }
    rule false-negative-examples-measure {
        <false-word> <negative-word> <examples-word>    | 'FalseNegativeExamples'
    }
    rule false-negative-number-measure {
        <false-word> <negative-word> <number-word>    | 'FalseNegativeNumber'
    }
    rule false-negative-rate-measure {
        <false-word> <negative-word> <rate-word>    | 'FalseNegativeRate'
    }
    rule false-positive-examples-measure {
        <false-word> <positive-word> <examples-word>    | 'FalsePositiveExamples'
    }
    rule false-positive-number-measure {
        <false-word> <positive-word> <number-word>    | 'FalsePositiveNumber'
    }
    rule false-positive-rate-measure {
        <false-word> <positive-word> <rate-word>    | 'FalsePositiveRate'
    }
    rule geometric-mean-probability-measure {
        <geometric-word> <mean-word> <probability-word>    | 'GeometricMeanProbability'
    }
    rule indeterminate-examples-measure {
        <indeterminate-word> <examples-word>    | 'IndeterminateExamples'
    }
    rule least-certain-examples-measure {
        <least-word> <certain-word> <examples-word>    | 'LeastCertainExamples'
    }
    rule likelihood-measure {
        <likelihood-word>    | 'Likelihood'
    }
    rule log-likelihood-measure {
        <log-word> <likelihood-word>    | 'LogLikelihood'
    }
    rule matthews-correlation-coefficient-measure {
        <matthews-word> <correlation-word> <coefficient-word>    | 'MatthewsCorrelationCoefficient'
    }
    rule mean-cross-entropy-measure {
        <mean-word> <cross-word> <entropy-word>    | 'MeanCrossEntropy'
    }
    rule mean-decision-utility-measure {
        <mean-word> <decision-word> <utility-word>    | 'MeanDecisionUtility'
    }
    rule misclassified-examples-measure {
        <misclassified-word> <examples-word>    | 'MisclassifiedExamples'
    }
    rule most-certain-examples-measure {
        <most-word> <certain-word> <examples-word>    | 'MostCertainExamples'
    }
    rule negative-predictive-value-measure {
        <negative-word> <predictive-word> <value-word>    | 'NegativePredictiveValue'
    }
    rule perplexity-measure {
        <perplexity-word>    | 'Perplexity'
    }
    rule precision-measure {
        <precision-word>    | 'Precision'
    }
    rule probabilities-measure {
        <probabilities-word>    | 'Probabilities'
    }
    rule probability-histogram-measure {
        <probability-word> <histogram-word>    | 'ProbabilityHistogram'
    }
    rule properties-measure {
        <properties-word>    | 'Properties'
    }
    rule recall-measure {
        <recall-word>    | 'Recall'
    }
    rule rejection-rate-measure {
        <rejection-word> <rate-word>    | 'RejectionRate'
    }
    rule reliability-data-measure {
        <reliability-word> <data-word>    | 'ReliabilityData'
    }
    rule reliability-diagram-measure {
        <reliability-word> <diagram-word>    | 'ReliabilityDiagram'
    }
    rule report-measure {
        <report-word>    | 'Report'
    }
    rule curve-measure {
        <curve-word>    | 'ROCCurve'
    }
    rule scott-pi-measure {
        <scott-word> <pi-word>    | 'ScottPi'
    }
    rule specificity-measure {
        <specificity-word>    | 'Specificity'
    }
    rule top-confusions-measure {
        <top-word> <confusions-word>    | 'TopConfusions'
    }
    rule true-negative-examples-measure {
        <true-word> <negative-word> <examples-word>    | 'TrueNegativeExamples'
    }
    rule true-negative-number-measure {
        <true-word> <negative-word> <number-word>    | 'TrueNegativeNumber'
    }
    rule true-positive-examples-measure {
        <true-word> <positive-word> <examples-word>    | 'TruePositiveExamples'
    }
    rule true-positive-number-measure {
        <true-word> <positive-word> <number-word>    | 'TruePositiveNumber'
    }
    rule worst-classified-examples-measure {
        <worst-word> <classified-word> <examples-word>    | 'WorstClassifiedExamples'
    }
    token accuracy-word { 'accuracy' }
    token area-word { 'area' }
    token baseline-word { 'baseline' }
    token batch-word { 'batch' }
    token best-word { 'best' }
    token certain-word { 'certain' }
    token class-word { 'class' }
    token classic-word { 'classic' }
    token classified-word { 'classified' }
    token classifier-word { 'classifier' }
    token coefficient-word { 'coefficient' }
    token cohen-word { 'cohen' }
    token confusion-word { 'confusion' }
    token confusions-word { 'confusions' }
    token correctly-word { 'correctly' }
    token correlation-word { 'correlation' }
    token cross-word { 'cross' }
    token curve-word { 'curve' }
    token data-word { 'data' }
    token decision-word { 'decision' }
    token diagram-word { 'diagram' }
    token discovery-word { 'discovery' }
    token distribution-word { 'distribution' }
    token entropy-word { 'entropy' }
    token error-word { 'error' }
    token evaluation-word { 'evaluation' }
    token examples-word { 'examples' }
    token f1-word { 'f1' }
    token false-word { 'false' }
    token function-word { 'function' }
    token geometric-word { 'geometric' }
    token histogram-word { 'histogram' }
    token indeterminate-word { 'indeterminate' }
    token kappa-word { 'kappa' }
    token least-word { 'least' }
    token likelihood-word { 'likelihood' }
    token log-word { 'log' }
    token matrix-word { 'matrix' }
    token matthews-word { 'matthews' }
    token mean-word { 'mean' }
    token misclassified-word { 'misclassified' }
    token most-word { 'most' }
    token negative-word { 'negative' }
    token number-word { 'number' }
    token perplexity-word { 'perplexity' }
    token pi-word { 'pi' }
    token plot-word { 'plot' }
    token positive-word { 'positive' }
    token precision-word { 'precision' }
    token predictive-word { 'predictive' }
    token probabilities-word { 'probabilities' }
    token probability-word { 'probability' }
    token properties-word { 'properties' }
    token rate-word { 'rate' }
    token recall-word { 'recall' }
    token rejection-word { 'rejection' }
    token reliability-word { 'reliability' }
    token report-word { 'report' }
    token score-word { 'score' }
    token scott-word { 'scott' }
    token specificity-word { 'specificity' }
    token time-word { 'time' }
    token top-word { 'top' }
    token true-word { 'true' }
    token under-word { 'under' }
    token utilities-word { 'utilities' }
    token utility-word { 'utility' }
    token value-word { 'value' }
    token worst-word { 'worst' }
}