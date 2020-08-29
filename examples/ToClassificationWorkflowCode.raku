#!/usr/bin/env perl6
use DSL::English::ClassificationWorkflows;

sub MAIN(Str $commands, Str $target = 'WL-ClCon' ) {
    put ToClassificationWorkflowCode($commands, $target);
}