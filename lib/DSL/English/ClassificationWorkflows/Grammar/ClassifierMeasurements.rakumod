
use DSL::Shared::Utilities::FuzzyMatching;

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

    rule accuracy-measure {<accuracy-measure-word> | 'Accuracy'}
    rule accuracy-baseline-measure {<accuracy-measure-word> <baseline-measure-word> | 'AccuracyBaseline'}
    rule accuracy-rejection-plot-measure {<accuracy-measure-word> <rejection-measure-word> <plot-measure-word> | 'AccuracyRejectionPlot'}
    rule area-under-curve-measure {<area-measure-word> <under-measure-word> <curve-measure-word> | 'AreaUnderROCCurve'}
    rule batch-evaluation-time-measure {<batch-measure-word> <evaluation-measure-word> <time-measure-word> | 'BatchEvaluationTime'}
    rule best-classified-examples-measure {<best-measure-word> <classified-measure-word> <examples-measure-word> | 'BestClassifiedExamples'}
    rule classic-reliability-diagram-measure {<classic-measure-word> <reliability-measure-word> <diagram-measure-word> | 'ClassicReliabilityDiagram'}
    rule classifier-function-measure {<classifier-measure-word> <function-measure-word> | 'ClassifierFunction'}
    rule class-mean-cross-entropy-measure {<class-measure-word> <mean-measure-word> <cross-measure-word> <entropy-measure-word> | 'ClassMeanCrossEntropy'}
    rule class-rejection-rate-measure {<class-measure-word> <rejection-measure-word> <rate-measure-word> | 'ClassRejectionRate'}
    rule cohen-kappa-measure {<cohen-measure-word> <kappa-measure-word> | 'CohenKappa'}
    rule confusion-distribution-measure {<confusion-measure-word> <distribution-measure-word> | 'ConfusionDistribution'}
    rule confusion-function-measure {<confusion-measure-word> <function-measure-word> | 'ConfusionFunction'}
    rule confusion-matrix-measure {<confusion-measure-word> <matrix-measure-word> | 'ConfusionMatrix'}
    rule confusion-matrix-plot-measure {<confusion-measure-word> <matrix-measure-word> <plot-measure-word> | 'ConfusionMatrixPlot'}
    rule correctly-classified-examples-measure {<correctly-measure-word> <classified-measure-word> <examples-measure-word> | 'CorrectlyClassifiedExamples'}
    rule decision-utilities-measure {<decision-measure-word> <utilities-measure-word> | 'DecisionUtilities'}
    rule error-measure {<error-measure-word> | 'Error'}
    rule evaluation-time-measure {<evaluation-measure-word> <time-measure-word> | 'EvaluationTime'}
    rule examples-measure {<examples-measure-word> | 'Examples'}
    rule f1-score-measure {<f1-measure-word> <score-measure-word> | 'F1Score'}
    rule false-discovery-rate-measure {<false-measure-word> <discovery-measure-word> <rate-measure-word> | 'FalseDiscoveryRate'}
    rule false-negative-examples-measure {<false-measure-word> <negative-measure-word> <examples-measure-word> | 'FalseNegativeExamples'}
    rule false-negative-number-measure {<false-measure-word> <negative-measure-word> <number-measure-word> | 'FalseNegativeNumber'}
    rule false-negative-rate-measure {<false-measure-word> <negative-measure-word> <rate-measure-word> | 'FalseNegativeRate'}
    rule false-positive-examples-measure {<false-measure-word> <positive-measure-word> <examples-measure-word> | 'FalsePositiveExamples'}
    rule false-positive-number-measure {<false-measure-word> <positive-measure-word> <number-measure-word> | 'FalsePositiveNumber'}
    rule false-positive-rate-measure {<false-measure-word> <positive-measure-word> <rate-measure-word> | 'FalsePositiveRate'}
    rule geometric-mean-probability-measure {<geometric-measure-word> <mean-measure-word> <probability-measure-word> | 'GeometricMeanProbability'}
    rule indeterminate-examples-measure {<indeterminate-measure-word> <examples-measure-word> | 'IndeterminateExamples'}
    rule least-certain-examples-measure {<least-measure-word> <certain-measure-word> <examples-measure-word> | 'LeastCertainExamples'}
    rule likelihood-measure {<likelihood-measure-word> | 'Likelihood'}
    rule log-likelihood-measure {<log-measure-word> <likelihood-measure-word> | 'LogLikelihood'}
    rule matthews-correlation-coefficient-measure {<matthews-measure-word> <correlation-measure-word> <coefficient-measure-word> | 'MatthewsCorrelationCoefficient'}
    rule mean-cross-entropy-measure {<mean-measure-word> <cross-measure-word> <entropy-measure-word> | 'MeanCrossEntropy'}
    rule mean-decision-utility-measure {<mean-measure-word> <decision-measure-word> <utility-measure-word> | 'MeanDecisionUtility'}
    rule misclassified-examples-measure {<misclassified-measure-word> <examples-measure-word> | 'MisclassifiedExamples'}
    rule most-certain-examples-measure {<most-measure-word> <certain-measure-word> <examples-measure-word> | 'MostCertainExamples'}
    rule negative-predictive-value-measure {<negative-measure-word> <predictive-measure-word> <value-measure-word> | 'NegativePredictiveValue'}
    rule perplexity-measure {<perplexity-measure-word> | 'Perplexity'}
    rule precision-measure {<precision-measure-word> | 'Precision'}
    rule probabilities-measure {<probabilities-measure-word> | 'Probabilities'}
    rule probability-histogram-measure {<probability-measure-word> <histogram-measure-word> | 'ProbabilityHistogram'}
    rule properties-measure {<properties-measure-word> | 'Properties'}
    rule recall-measure {<recall-measure-word> | 'Recall'}
    rule rejection-rate-measure {<rejection-measure-word> <rate-measure-word> | 'RejectionRate'}
    rule reliability-data-measure {<reliability-measure-word> <data-measure-word> | 'ReliabilityData'}
    rule reliability-diagram-measure {<reliability-measure-word> <diagram-measure-word> | 'ReliabilityDiagram'}
    rule report-measure {<report-measure-word> | 'Report'}
    rule curve-measure {<curve-measure-word> | 'ROCCurve'}
    rule scott-pi-measure {<scott-measure-word> <pi-measure-word> | 'ScottPi'}
    rule specificity-measure {<specificity-measure-word> | 'Specificity'}
    rule top-confusions-measure {<top-measure-word> <confusions-measure-word> | 'TopConfusions'}
    rule true-negative-examples-measure {<true-measure-word> <negative-measure-word> <examples-measure-word> | 'TrueNegativeExamples'}
    rule true-negative-number-measure {<true-measure-word> <negative-measure-word> <number-measure-word> | 'TrueNegativeNumber'}
    rule true-positive-examples-measure {<true-measure-word> <positive-measure-word> <examples-measure-word> | 'TruePositiveExamples'}
    rule true-positive-number-measure {<true-measure-word> <positive-measure-word> <number-measure-word> | 'TruePositiveNumber'}
    rule worst-classified-examples-measure {<worst-measure-word> <classified-measure-word> <examples-measure-word> | 'WorstClassifiedExamples'}

    token accuracy-measure-word { 'accuracy' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'accuracy') }> }
    token area-measure-word { 'area' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'area') }> }
    token baseline-measure-word { 'baseline' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'baseline') }> }
    token batch-measure-word { 'batch' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'batch') }> }
    token best-measure-word { 'best' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'best') }> }
    token certain-measure-word { 'certain' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'certain') }> }
    token class-measure-word { 'class' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'class') }> }
    token classic-measure-word { 'classic' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'classic') }> }
    token classified-measure-word { 'classified' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'classified') }> }
    token classifier-measure-word { 'classifier' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'classifier') }> }
    token coefficient-measure-word { 'coefficient' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'coefficient') }> }
    token cohen-measure-word { 'cohen' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'cohen') }> }
    token confusion-measure-word { 'confusion' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'confusion') }> }
    token confusions-measure-word { 'confusions' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'confusions') }> }
    token correctly-measure-word { 'correctly' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'correctly') }> }
    token correlation-measure-word { 'correlation' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'correlation') }> }
    token cross-measure-word { 'cross' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'cross') }> }
    token curve-measure-word { 'curve' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'curve') }> }
    token data-measure-word { 'data' }
    token decision-measure-word { 'decision' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'decision') }> }
    token diagram-measure-word { 'diagram' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'diagram') }> }
    token discovery-measure-word { 'discovery' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'discovery') }> }
    token distribution-measure-word { 'distribution' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'distribution') }> }
    token entropy-measure-word { 'entropy' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'entropy') }> }
    token error-measure-word { 'error' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'error') }> }
    token evaluation-measure-word { 'evaluation' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'evaluation') }> }
    token examples-measure-word { 'examples' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'examples') }> }
    token f1-measure-word { 'f1' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'f1') }> }
    token false-measure-word { 'false' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'false') }> }
    token function-measure-word { 'function' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'function') }> }
    token geometric-measure-word { 'geometric' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'geometric') }> }
    token histogram-measure-word { 'histogram' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'histogram') }> }
    token indeterminate-measure-word { 'indeterminate' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'indeterminate') }> }
    token kappa-measure-word { 'kappa' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'kappa') }> }
    token least-measure-word { 'least' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'least') }> }
    token likelihood-measure-word { 'likelihood' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'likelihood') }> }
    token log-measure-word { 'log' | 'lg' }
    token matrix-measure-word { 'matrix' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'matrix') }> }
    token matthews-measure-word { 'matthews' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'matthews') }> }
    token mean-measure-word { 'mean' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'mean') }> }
    token misclassified-measure-word { 'misclassified' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'misclassified') }> }
    token most-measure-word { 'most' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'most') }> }
    token negative-measure-word { 'negative' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'negative') }> }
    token number-measure-word { 'number' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'number') }> }
    token perplexity-measure-word { 'perplexity' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'perplexity') }> }
    token pi-measure-word { 'pi' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'pi') }> }
    token plot-measure-word { 'plot' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'plot') }> }
    token positive-measure-word { 'positive' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'positive') }> }
    token precision-measure-word { 'precision' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'precision') }> }
    token predictive-measure-word { 'predictive' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'predictive') }> }
    token probabilities-measure-word { 'probabilities' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'probabilities') }> }
    token probability-measure-word { 'probability' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'probability') }> }
    token properties-measure-word { 'properties' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'properties') }> }
    token rate-measure-word { 'rate' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'rate') }> }
    token recall-measure-word { 'recall' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'recall') }> }
    token rejection-measure-word { 'rejection' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'rejection') }> }
    token reliability-measure-word { 'reliability' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'reliability') }> }
    token report-measure-word { 'report' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'report') }> }
    token score-measure-word { 'score' | ([\w]+) <?{ $0.Str ne 'scott' and is-fuzzy-match( $0.Str, 'score') }> }
    token scott-measure-word { 'scott' | ([\w]+) <?{ $0.Str ne 'score' and is-fuzzy-match( $0.Str, 'scott') }> }
    token specificity-measure-word { 'specificity' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'specificity') }> }
    token time-measure-word { 'time' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'time') }> }
    token top-measure-word { 'top' }
    token true-measure-word { 'true' }
    token under-measure-word { 'under' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'under') }> }
    token utilities-measure-word { 'utilities' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'utilities') }> }
    token utility-measure-word { 'utility' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'utility') }> }
    token value-measure-word { 'value' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'value') }> }
    token worst-measure-word { 'worst' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'worst') }> }
}
