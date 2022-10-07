=begin pod

=head1 DSL::English::ClassificationWorkflows

C<DSL::English::ClassificationWorkflows> package has grammar and action classes for the parsing and
interpretation of natural language commands that specify classification workflows.

=head1 Synopsis

    use DSL::English::ClassificationWorkflows;
    my $rcode = ToClassificationWorkflowCode('use dfTitanic; split data in training and testing parts with ratio 0.7; make a classifier; show roc curves');

=end pod

unit module DSL::English::ClassificationWorkflows;

use DSL::Shared::Utilities::CommandProcessing;

use DSL::Entity::MachineLearning;

use DSL::English::ClassificationWorkflows::Grammar;
use DSL::English::ClassificationWorkflows::Actions::WL::ClCon;
use DSL::English::ClassificationWorkflows::Actions::WL::System;

use DSL::English::ClassificationWorkflows::Actions::Bulgarian::Standard;
use DSL::English::ClassificationWorkflows::Actions::English::Standard;
use DSL::English::ClassificationWorkflows::Actions::Russian::Standard;

#-----------------------------------------------------------
my %targetToAction{Str} =
    "Mathematica"      => DSL::English::ClassificationWorkflows::Actions::WL::System,
    "WL-ClCon"         => DSL::English::ClassificationWorkflows::Actions::WL::ClCon,
    "WL"               => DSL::English::ClassificationWorkflows::Actions::WL::System,
    "WL-System"        => DSL::English::ClassificationWorkflows::Actions::WL::System,
    "Bulgarian"        => DSL::English::ClassificationWorkflows::Actions::Bulgarian::Standard,
    "English"          => DSL::English::ClassificationWorkflows::Actions::English::Standard,
    "Russian"          => DSL::English::ClassificationWorkflows::Actions::Russian::Standard;

my %targetToAction2{Str} = %targetToAction.grep({ $_.key.contains('-') }).map({ $_.key.subst('-', '::') => $_.value }).Hash;
%targetToAction = |%targetToAction , |%targetToAction2;

my Str %targetToSeparator{Str} =
    "Julia"            => "\n",
    "Julia-DataFrames" => "\n",
    "R"                => " ;\n",
    "Mathematica"      => " \\[DoubleLongRightArrow]\n",
    "WL"               => ";\n",
    "WL-ClCon"         => " \\[DoubleLongRightArrow]\n",
    "WL-System"        => ";\n",
    "Bulgarian"        => " \n",
    "English"          => " \n",
    "Russian"          => " \n";

my Str %targetToSeparator2{Str} = %targetToSeparator.grep({ $_.key.contains('-') }).map({ $_.key.subst('-', '::') => $_.value }).Hash;
%targetToSeparator = |%targetToSeparator , |%targetToSeparator2;

#-----------------------------------------------------------
sub ClassificationWorkflowsGrammar(Str $lang is copy = 'English') is export {
    $lang = $lang.wordcase;

    my $gname = "DSL::{$lang}::ClassificationWorkflows::Grammar";

    try require ::($gname);
    if ::($gname) ~~ Failure { die "Failed to load the grammar $gname." }

    my Grammar $grammar = ::($gname);

    $grammar.set-resources(DSL::Entity::MachineLearning::resource-access-object());
    return $grammar;
}

#-----------------------------------------------------------
proto ToClassificationWorkflowCode(Str $command, Str $target = 'WL-ClCon', | ) is export {*}

multi ToClassificationWorkflowCode ( Str $command, Str $target = 'WL-ClCon', *%args ) {
    my $lang = %args<language>:exists ?? %args<language> !! 'English';

    my Grammar $pCOMMAND = ClassificationWorkflowsGrammar($lang);

    my $ACTOBJ = %targetToAction{$target}.new(resources => DSL::Entity::MachineLearning::resource-access-object());

    my %args2 = %args.grep({ $_.key ∈ <format splitter> });

    DSL::Shared::Utilities::CommandProcessing::ToWorkflowCode( $command,
                                                               grammar => $pCOMMAND,
                                                               actions => $ACTOBJ,
                                                               separator => %targetToSeparator{$target},
                                                               |%args2 )
}
