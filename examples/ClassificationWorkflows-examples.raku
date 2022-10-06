use lib './lib';
use lib '.';
use DSL::English::ClassificationWorkflows;

# Shortcuts
#-----------------------------------------------------------
my $pCOMMAND = DSL::English::ClassificationWorkflows::Grammar;

sub clcon-parse(Str:D $command, Str:D :$rule = 'TOP') {
    $pCOMMAND.parse($command, :$rule);
}

sub clcon-interpret(Str:D $command,
                    Str:D:$rule = 'TOP',
                    :$actions = DSL::English::ClassificationWorkflows::Actions::WL::ClCon.new) {
    $pCOMMAND.parse($command, :$rule, :$actions).made;
}

#----------------------------------------------------------


#use Grammar::Tracer;
#say $pCOMMAND.parse( 'create classifier ensemble of 5 RandomForest classifiers', rule => 'ensemble-creation-num');
#say $pCOMMAND.parse( 'create classifier ensemble with 5 of RandomForest classifiers', rule => 'classifier-ensemble-creation-command');
#say $pCOMMAND.parse( 'create classifier ensemble with 5 of RandomForest classifiers using 0.7 resampling', rule => 'classifier-ensemble-creation-command');
#say $pCOMMAND.parse( 'create classifier ensemble with 5 of RandomForest classifiers using 70 % resampling', rule => 'classifier-ensemble-creation-command');
#say $pCOMMAND.subparse( 'split data with ratio 0.8 and with label proportional method');


say "=" x 60;

#my $commands = '
#DSL TARGET WL-ClCon;
#use dfTitanic;
#split data with fraction 0.8, method class label proportional;
#make a gradient boosted trees classifier;
#show classifier training time, and method;
#show classifier precision and recall and confusion matrix plot;
#show roc plots of TPR and FPR;
#assign pipeline object to clObj120';

#my $commands = '
#use dfTitanic;
#split data with fraction 0.8, method class label proportional;
#make a gradient boosted trees classifier;
#show top confusions, misclassified examples, MeanCrossEntropy for the classifier;
#show measurements test results over the available test data;
#show LeastCertainExamples;
#compute classifier measurements Recall by threshold 0.3 for "died" over available test data;
#test the classifier;
#compute and show variable importance estimates;
#';

#my @testCommands = (
#'use classifier object clObj;
#split data with ratio 0.8 using label proportional method;
#create an ensemble using 15 random forest classifiers;
#show classifier misclassified examples and least certain examples'
#);

my @testCommands = (
'DSL MODULE ClCon;
setup code;
use dfTitanic;
reduce dimension;
split data with split ratio 0.82 and validation fraction 0.2;
make gradient boosted trees classifier;
show classifier training time;
show classifier measurements;
show classifier confusion matrix plot, ROCCurve;
show top confusions, misclassified examples, least certain examples;
show pipeline value;
assign pipeline object to clObj120;'
);

#@testCommands = (
#'DSL MODULE ClCon;
#use data dfTitanic;
#split data with fraction 0.8;
#show classifier measurements;
#show classifier confusion matrix plot, ROCCurve;
#'
#);


#my @targets = ('WL-ClCon', 'WL-System');
my @targets = ('WL-System', 'WL-ClCon');
#my @targets = <Bulgarian English Russian>;

for @testCommands -> $c {
    say "=" x 30;
    say $c;
    for @targets -> $t {
        say '-' x 30;
        say $t;
        say '-' x 30;
        my $start = now;
        my $res = ToClassificationWorkflowCode($c, $t, format => 'hash');
        say "time:", now - $start;
        say $res;
    }
}

#say clcon-parse( @testCommands[0], rule => 'workflow-commands-list' );
#say clcon-interpret(
#        @testCommands[0],
#        rule => 'workflow-commands-list',
#        actions => DSL::English::ClassificationWorkflows::Actions::WL::ClCon.new);
