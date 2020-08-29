use lib './lib';
use lib '.';
use DSL::English::ClassificationWorkflows;

say DSL::English::ClassificationWorkflows::Grammar.parse( 'split data with fraction 0.8' );

say "=" x 10;

my $commands = 'use dfTitanic; split data with fraction 0.7; make classifier; show rocs';

say "\n", '=' x 30;
say '-' x 3, 'WL-ClCon:';
say '=' x 30;


say ToClassificationWorkflowCode($commands, 'WL-ClCon');


say "\n", '=' x 30;
say '-' x 3, 'Bulgarian:';
say '=' x 30;

say ToClassificationWorkflowCode($commands, 'Bulgarian');
