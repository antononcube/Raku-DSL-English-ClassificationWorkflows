use v6;
use lib 'lib';
use DSL::English::ClassificationWorkflows::Grammar;
use Test;

plan 6;

# Shortcut
my $pCOMMAND = DSL::English::ClassificationWorkflows::Grammar;

#-----------------------------------------------------------
# Find outliers commands
#-----------------------------------------------------------

ok $pCOMMAND.parse('find outliers'),
        'find outliers';

ok $pCOMMAND.parse('find top outliers'),
        'find top outliers';

ok $pCOMMAND.parse('display the data largest outliers'),
        'display the data largest outliers';

ok $pCOMMAND.parse('find the top outliers per class'),
        'find top the outliers per class';

ok $pCOMMAND.parse('remove data bottom outliers'),
        'remove data bottom outliers';

ok $pCOMMAND.parse('remove the data top outliers'),
        'remove the data top outliers';



done-testing;