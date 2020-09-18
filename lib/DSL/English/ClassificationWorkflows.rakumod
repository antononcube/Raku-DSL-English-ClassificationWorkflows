=begin pod

=head1 DSL::English::ClassificationWorkflows

C<DSL::English::ClassificationWorkflows> package has grammar and action classes for the parsing and
interpretation of natural language commands that specify classification workflows.

=head1 Synopsis

    use DSL::English::ClassificationWorkflows;
    my $rcode = ToClassificationWorkflowCode('use dfTitanic; split data in training and testing parts with ratio 0.7; make a classifier; show roc curves');

=end pod

unit module DSL::English::ClassificationWorkflows;

use DSL::Shared::Utilities::MetaSpecifications;

use DSL::English::ClassificationWorkflows::Grammar;
use DSL::English::ClassificationWorkflows::Actions::WL::ClCon;
use DSL::English::ClassificationWorkflows::Actions::WL::System;

use DSL::English::ClassificationWorkflows::Actions::Bulgarian::Standard;

#-----------------------------------------------------------
my %targetToAction =
    "Mathematica"      => DSL::English::ClassificationWorkflows::Actions::WL::System,
    "WL-ClCon"         => DSL::English::ClassificationWorkflows::Actions::WL::ClCon,
    "WL"               => DSL::English::ClassificationWorkflows::Actions::WL::System,
    "WL-System"        => DSL::English::ClassificationWorkflows::Actions::WL::System,
    "Bulgarian"        => DSL::English::ClassificationWorkflows::Actions::Bulgarian::Standard;

my %targetToSeparator{Str} =
    "Julia"            => "\n",
    "Julia-DataFrames" => "\n",
    "R"                => " ;\n",
    "Mathematica"      => "\n",
    "WL"               => ";\n",
    "WL-ClCon"         => " ==>\n",
    "WL-System"        => ";\n",
    "Bulgarian"        => "\n";


#-----------------------------------------------------------
sub has-semicolon (Str $word) {
    return defined index $word, ';';
}

#-----------------------------------------------------------
proto ToClassificationWorkflowCode(Str $command, Str $target = 'tidyverse' ) is export {*}

multi ToClassificationWorkflowCode ( Str $command where not has-semicolon($command), Str $target = 'WL-ClCon' ) {

    die 'Unknown target.' unless %targetToAction{$target}:exists;

    my $match = DSL::English::ClassificationWorkflows::Grammar.parse($command.trim, actions => %targetToAction{$target} );
    die 'Cannot parse the given command.' unless $match;
    return $match.made;
}

multi ToClassificationWorkflowCode ( Str $command where has-semicolon($command), Str $target = 'WL-ClCon' ) {

    my $specTarget = get-dsl-spec( $command, 'target');

    $specTarget = !$specTarget ?? $target !! $specTarget.value;

    die 'Unknown target.' unless %targetToAction{$specTarget}:exists;

    my @commandLines = $command.trim.split(/ ';' \s* /);

    @commandLines = grep { $_.Str.chars > 0 }, @commandLines;

    my @cmdLines = map { ToClassificationWorkflowCode($_, $specTarget) }, @commandLines;

    @cmdLines = grep { $_.^name eq 'Str' }, @cmdLines;

    return @cmdLines.join( %targetToSeparator{$specTarget} ).trim;
}
