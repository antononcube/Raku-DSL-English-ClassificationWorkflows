use v6;
use lib 'lib';
use DSL::English::ClassificationWorkflows::Grammar;
use Test;

plan 16;

# Shortcut
my $pCOMMAND = DSL::English::ClassificationWorkflows::Grammar;

#-----------------------------------------------------------
# Basic commands
#-----------------------------------------------------------

ok $pCOMMAND.parse('use data dfTitanic'),
        'use data dfTitanic';

ok $pCOMMAND.parse('use dfTitanic'),
        'use dfTitanic';

ok $pCOMMAND.parse('use classifier object obj1'),
        'use classifier object obj1';

ok $pCOMMAND.parse('use the object obj1'),
        'use the object obj1';

ok $pCOMMAND.parse('split data'),
        'split data';

ok $pCOMMAND.parse('split data with fraction 0.8'),
        'split data with fraction 0.8';

ok $pCOMMAND.parse('split data with training data fraction 0.8'),
        'split data with training data fraction 0.8';

ok $pCOMMAND.parse('split data with training split fraction 0.45'),
        'split data with training split fraction 0.45';

ok $pCOMMAND.parse('split data with training data fraction 0.8 and validation data fraction 0.1'),
        'split data with training data fraction 0.8 and validation data fraction 0.1';

ok $pCOMMAND.parse('split data with training split fraction 0.8 and validation fraction 0.2'),
        'split data with training split fraction 0.8 and validation data fraction 0.2';

ok $pCOMMAND.parse('make classifier'),
        'make classifier';

ok $pCOMMAND.parse('make classifier with DecisionTree'),
        'make classifier with DecisionTree';

ok $pCOMMAND.parse('make classifier with LogisticRegression'),
        'make classifier with LogisticRegression';

ok $pCOMMAND.parse('classifier measurements'),
        'classifier measurements';

ok $pCOMMAND.parse('rocs'),
        'rocs';

ok $pCOMMAND.parse('display roc plots'),
        'display roc plots';

done-testing;