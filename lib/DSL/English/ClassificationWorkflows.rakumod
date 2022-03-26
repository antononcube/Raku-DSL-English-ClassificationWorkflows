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

use DSL::English::ClassificationWorkflows::Grammar;
use DSL::English::ClassificationWorkflows::Actions::WL::ClCon;
use DSL::English::ClassificationWorkflows::Actions::WL::System;

use DSL::English::ClassificationWorkflows::Actions::Bulgarian::Standard;
use DSL::English::ClassificationWorkflows::Actions::English::Standard;

#-----------------------------------------------------------
my %targetToAction{Str} =
    "Mathematica"      => DSL::English::ClassificationWorkflows::Actions::WL::System,
    "WL-ClCon"         => DSL::English::ClassificationWorkflows::Actions::WL::ClCon,
    "WL::ClCon"        => DSL::English::ClassificationWorkflows::Actions::WL::ClCon,
    "WL"               => DSL::English::ClassificationWorkflows::Actions::WL::System,
    "WL-System"        => DSL::English::ClassificationWorkflows::Actions::WL::System,
    "WL::System"       => DSL::English::ClassificationWorkflows::Actions::WL::System,
    "Bulgarian"        => DSL::English::ClassificationWorkflows::Actions::Bulgarian::Standard,
    "English"          => DSL::English::ClassificationWorkflows::Actions::English::Standard;

my Str %targetToSeparator{Str} =
    "Julia"            => "\n",
    "Julia-DataFrames" => "\n",
    "R"                => " ;\n",
    "Mathematica"      => " \\[DoubleLongRightArrow]\n",
    "WL"               => ";\n",
    "WL-ClCon"         => " \\[DoubleLongRightArrow]\n",
    "WL::ClCon"        => " \\[DoubleLongRightArrow]\n",
    "WL-System"        => ";\n",
    "WL::System"       => ";\n",
    "Bulgarian"        => " \n",
    "English"          => " \n";


#-----------------------------------------------------------
sub has-semicolon (Str $word) {
    return defined index $word, ';';
}

#-----------------------------------------------------------
proto ToClassificationWorkflowCode(Str $command, Str $target = 'WL::ClCon', | ) is export {*}

multi ToClassificationWorkflowCode ( Str $command, Str $target = 'WL-ClCon', *%args ) {

    DSL::Shared::Utilities::CommandProcessing::ToWorkflowCode( $command,
                                                               grammar => DSL::English::ClassificationWorkflows::Grammar,
                                                               :%targetToAction,
                                                               :%targetToSeparator,
                                                               :$target,
                                                               |%args )
}
