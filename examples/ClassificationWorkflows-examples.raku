use lib './lib';
use lib '.';
use DSL::English::ClassificationWorkflows;

#say DSL::English::ClassificationWorkflows::Grammar.parse( 'split data with fraction 0.8' );

say "=" x 10;

#my $commands = '
#DSL TARGET WL-ClCon;
#use dfTitanic;
#split data with fraction 0.8, method class label proportional;
#make a gradient boosted trees classifier;
#show classifier training time, and method;
#show classifier precision and recall and confusion matrix plot;
#show roc plots of TPR and FPR;
#assign pipeline object to clObj120';

my $commands = '
use dfTitanic;
split data with fraction 0.8, method class label proportional;
make a gradient boosted trees classifier;
show top confusions, misclassified examples, MeanCrossEntropy for the classifier;
show measurements test results over the available test data;
show LeastCertainExamples;
compute classifier measurements Recall by threshold 0.3 for "died" over available test data;
test the classifier;
compute and show variable importance estimates;
';

say "\n", '=' x 30;
say '-' x 3, 'WL-ClCon:';
say '=' x 30;


say ToClassificationWorkflowCode($commands, 'WL-ClCon');

#
#say "\n", '=' x 30;
#say '-' x 3, 'Bulgarian:';
#say '=' x 30;
#
#say ToClassificationWorkflowCode($commands, 'Bulgarian');
