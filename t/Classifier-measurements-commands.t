use v6;
use lib 'lib';
use DSL::English::ClassificationWorkflows::Grammar;
use Test;

plan 8;

# Shortcut
my $pCOMMAND = DSL::English::ClassificationWorkflows::Grammar;

#-----------------------------------------------------------
# Classifier measurements
#-----------------------------------------------------------

ok $pCOMMAND.parse('classifier measurements'),
        'classifier measurements';

ok $pCOMMAND.parse('show top confusions, misclassified examples, MeanCrossEntropy for the classifier'),
        'show top confusions, misclassified examples, MeanCrossEntropy for the classifier';

ok $pCOMMAND.parse('show measurements test results over the available test data'),
        'show measurements test results over the available test data';

ok $pCOMMAND.parse('show LeastCertainExample'),
        'show LeastCertainExample';

ok $pCOMMAND.parse('show classifier LeastCertainExample'),
        'show classifier LeastCertainExample';

ok $pCOMMAND.parse('compute classifier measurements Recall by threshold 0.3 for "died" over available test data'),
        'compute classifier measurements Recall by threshold 0.3 for "died" over available test data';


#-----------------------------------------------------------
# Classifier testing
#-----------------------------------------------------------

ok $pCOMMAND.parse('test the classifier'),
        'test the classifier';

ok $pCOMMAND.parse('compute and show variable importance estimates'),
        'compute and show variable importance estimates';

done-testing;