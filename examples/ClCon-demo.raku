
use DSL::English::ClassificationWorkflows;

# Shortcuts
#-----------------------------------------------------------
my $pCOMMAND = DSL::English::ClassificationWorkflows::Grammar;
$pCOMMAND.set-resources(DSL::Entity::MachineLearning::resource-access-object());

sub clcon-parse(Str:D $command, Str:D :$rule = 'TOP') {
    $pCOMMAND.parse($command, :$rule);
}

sub clcon-subparse(Str:D $command, Str:D :$rule = 'TOP') {
    $pCOMMAND.subparse($command, :$rule);
}

sub clcon-interpret(Str:D $command,
                    Str:D:$rule = 'TOP',
                    :$actions = DSL::English::ClassificationWorkflows::Actions::WL::ClCon.new) {
    $pCOMMAND.parse($command, :$rule, :$actions).made;
}

#----------------------------------------------------------

say clcon-subparse( 'PPV,and TPR', rule => 'roc-functions-list' );

#----------------------------------------------------------
say "=" x 60;

my $commands = '
DSL TARGET WL-ClCon;
use dfTitanic;
split data with fraction 0.8, method class label proportional;
make a gradient boosted trees classifier;
show classifier training time, and method;
show classifier precision and recall and confusion matrix plot;
show roc plots of TPR and FPR;
assign pipeline object to clObj120';

say ToClassificationWorkflowCode($commands);
