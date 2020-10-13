class DSL::English::ClassificationWorkflows::Actions::WL::ROCFunctions {

    method roc-function($/) { make '"' ~ $/.values[0].made ~ '"'; }

    method tpr-roc-func($/) { make 'TPR'; }
    method tnr-roc-func($/) { make 'TNR'; }
    method spc-roc-func($/) { make 'SPC'; }
    method ppv-roc-func($/) { make 'PPV'; }
    method npv-roc-func($/) { make 'NPV'; }
    method fpr-roc-func($/) { make 'FPR'; }
    method fdr-roc-func($/) { make 'FDR'; }
    method fnr-roc-func($/) { make 'FNR'; }
    method acc-roc-func($/) { make 'ACC'; }
    method auroc-roc-func($/) { make 'AUROC'; }
    method for-roc-func($/) { make 'FOR'; }
    method f1-roc-func($/) { make 'F1'; }
    method recall-roc-func($/) { make 'Recall'; }
    method sensitivity-roc-func($/) { make 'Sensitivity'; }
    method precision-roc-func($/) { make 'Precision'; }
    method accuracy-roc-func($/) { make 'Accuracy'; }
    method specificity-roc-func($/) { make 'Specificity'; }
    method false-positive-rate-roc-func($/) { make 'FalsePositiveRate'; }
    method true-positive-rate-roc-func($/) { make 'TruePositiveRate'; }
    method false-negative-rate-roc-func($/) { make 'FalseNegativeRate'; }
    method true-negative-rate-roc-func($/) { make 'TrueNegativeRate'; }
    method false-discovery-rate-roc-func($/) { make 'FalseDiscoveryRate'; }
    method false-omission-rate-roc-func($/) { make 'FalseOmissionRate'; }
    method f1-score-roc-func($/) { make 'F1Score'; }
    method area-under-roc-curve-roc-func($/) { make 'AreaUnderROCCurve'; }
}
