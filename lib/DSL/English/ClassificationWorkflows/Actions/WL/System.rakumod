=begin comment
#==============================================================================
#
#   Classification Workflows WL-System actions in Raku (Perl 6)
#   Copyright (C) 2020  Anton Antonov
#
#   This program is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
#   Written by Anton Antonov,
#   antononcube @ gmai l . c om,
#   Windermere, Florida, USA.
#
#==============================================================================
#
#   For more details about Raku (Perl6) see https://raku.org/ .
#
#==============================================================================
=end comment

use v6;
use DSL::English::ClassificationWorkflows::Grammar;

unit module DSL::English::ClassificationWorkflows::Actions::WL::System;

class DSL::English::ClassificationWorkflows::Actions::WL::System {

    method TOP($/) { make $/.values[0].made; }

    # General
    method dataset-name($/) { make $/.Str; }
    method variable-name($/) { make $/.Str; }
    method list-separator($/) { make ','; }
    method variable-names-list($/) { make $<variable-name>>>.made; }
    method quoted-variable-names-list($/) { make $<quoted-variable-name>>>.made.join(', '); }
    method mixed-quoted-variable-names-list($/) { make $<mixed-quoted-variable-name>>>.made.join(', '); }
    method integer-value($/) { make $/.Str; }
    method number-value($/) { make $/.Str; }
    method wl-expr($/) { make $/.Str; }
    method quoted-variable-name($/) { make $/.values[0].made; }
    method mixed-quoted-variable-name($/) { make $/.values[0].made; }
    method single-quoted-variable-name($/) { make '"' ~ $<variable-name>.made ~ '"'; }
    method double-quoted-variable-name($/) { make '"' ~ $<variable-name>.made ~ '"'; }

    # Trivial
    method trivial-parameter($/) { make $/.values[0].made; }
    method trivial-parameter-none($/) { make 'None'; }
    method trivial-parameter-empty($/) { make '{}'; }
    method trivial-parameter-automatic($/) { make 'Automatic'; }
    method trivial-parameter-false($/) { make 'False'; }
    method trivial-parameter-true($/) { make 'True'; }

    # Load data
    method data-load-command($/) { make $/.values[0].made; }
    method load-data-table($/) { make 'ClConUnit[ ExampleData[' ~ $<data-location-spec>.made ~ '] ]'; }
    method data-location-spec($/) { make '\'' ~ $/.Str ~ '\''; }
    method use-data-table($/) { make 'ClConUnit[ ' ~ $<variable-name>.made ~ ' ]'; }

    # Split command
	method split-data-command($/) { make $/.values[0].made; }
    method split-data-simple($/) {
        if $<split-fraction> {
          make 'ClConSplitData[ ' ~ $<split-fraction>.made ~ ' ]';
        } else {
          make 'ClConSplitData[ 0.7 ]';
        }
    }
    method split-data-spec($/) {
        make 'ClConSplitData[ 0.7 ]';
    }

    # Data summary command
    method data-summary-command($/) { make $/.values[0].made; }
    method data-summary-simple($/){ make 'ClConEchoDataSummary[]'; }

    # Reduce dimension command
    method reduce-dimension-command($/) { make $/.values[0].made; }
    method reduce-dimension-simple($/){ make 'ClConReduceDimension[]'; }

    # Make classifier command
    method make-classifier-command($/) { make $/.values[0].made; }
    method make-classifier-simple($/){ make 'ClConMakeClassifier[]'; }

    # Classifier info command
    method classifier-info-command($/) { make $/.values[0].made; }
    method classifier-info-simple($/){ make 'CClConEchoFunctionContext[ClassifierInformation[#classifier] &]'; }

    # Classifier measurements command
    method classifier-measurements-command($/) { make $/.values[0].made; }
    method classifier-measurements-simple($/){ make 'ClConClassifierMeasurements[]'; }

    # ROC curves command
    method roc-curves-command($/) { make $/.values[0].made; }
    method roc-curves-simple($/){ make 'ClConROCPlot[]'; }

    # Pipeline command
    method pipeline-command($/) { make $/.values[0].made; }
    method take-pipeline-value($/) { make 'obj'; }
    method echo-pipeline-value($/) { make 'ClConEchoValue[]'; }

    method echo-command($/) { make 'ClConEcho[ ' ~ $<echo-message-spec>.made ~ ' ]'; }
    method echo-message-spec($/) { make $/.values[0].made; }
    method echo-words-list($/) { make '"' ~ $<variable-name>>>.made.join(' ') ~ '"'; }
    method echo-variable($/) { make $/.Str; }
    method echo-text($/) { make $/.Str; }
}
