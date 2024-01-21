
##=================================================================
## WARNING : Obsolete file, left in this repository as a reference.
##=================================================================

role DSL::English::ClassificationWorkflows::Grammar::ROCFunctions {

    rule roc-function {
        <tpr-roc-func> |
        <tnr-roc-func> |
        <spc-roc-func> |
        <ppv-roc-func> |
        <npv-roc-func> |
        <fpr-roc-func> |
        <fdr-roc-func> |
        <fnr-roc-func> |
        <acc-roc-func> |
        <auroc-roc-func> |
        <for-roc-func> |
        <f1-roc-func> |
        <recall-roc-func> |
        <sensitivity-roc-func> |
        <precision-roc-func> |
        <accuracy-roc-func> |
        <specificity-roc-func> |
        <false-positive-rate-roc-func> |
        <true-positive-rate-roc-func> |
        <false-negative-rate-roc-func> |
        <true-negative-rate-roc-func> |
        <false-discovery-rate-roc-func> |
        <false-omission-rate-roc-func> |
        <f1-score-roc-func> |
        <area-under-roc-curve-roc-func>}

    rule tpr-roc-func {'tpr' | 'TPR'}
    rule tnr-roc-func {'tnr' | 'TNR'}
    rule spc-roc-func {'spc' | 'SPC'}
    rule ppv-roc-func {'ppv' | 'PPV'}
    rule npv-roc-func {'npv' | 'NPV'}
    rule fpr-roc-func {'fpr' | 'FPR'}
    rule fdr-roc-func {'fdr' | 'FDR'}
    rule fnr-roc-func {'fnr' | 'FNR'}
    rule acc-roc-func {'acc' | 'ACC'}
    rule auroc-roc-func {'auroc' | 'AUROC'}
    rule for-roc-func {'for' | 'FOR'}
    rule f1-roc-func {'f1' | 'F1'}
    rule recall-roc-func {'recall' | 'Recall'}
    rule sensitivity-roc-func {'sensitivity' | 'Sensitivity'}
    rule precision-roc-func {'precision' | 'Precision'}
    rule accuracy-roc-func {'accuracy' | 'Accuracy'}
    rule specificity-roc-func {'specificity' | 'Specificity'}
    rule false-positive-rate-roc-func {'false' 'positive' 'rate' | 'FalsePositiveRate'}
    rule true-positive-rate-roc-func {'true' 'positive' 'rate' | 'TruePositiveRate'}
    rule false-negative-rate-roc-func {'false' 'negative' 'rate' | 'FalseNegativeRate'}
    rule true-negative-rate-roc-func {'true' 'negative' 'rate' | 'TrueNegativeRate'}
    rule false-discovery-rate-roc-func {'false' 'discovery' 'rate' | 'FalseDiscoveryRate'}
    rule false-omission-rate-roc-func {'false' 'omission' 'rate' | 'FalseOmissionRate'}
    rule f1-score-roc-func {'f1' 'score' | 'F1Score'}
    rule area-under-roc-curve-roc-func {'area' 'under' 'roc' 'curve' | 'AreaUnderROCCurve'}

}
