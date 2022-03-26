=begin comment
#==============================================================================
#
#   Classification Workflows English DSL actions in Raku (Perl 6)
#   Copyright (C) 2022  Anton Antonov
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
#   ʇǝu˙ɐʇɐpopuǝɔɔɐ@ǝqnɔuouoʇuɐ
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

use DSL::Shared::Actions::English::WL::PipelineCommand;
use DSL::Shared::Actions::CommonStructures;

unit module DSL::English::ClassificationWorkflows::Actions::English::Standard;

class DSL::English::ClassificationWorkflows::Actions::English::Standard
        is DSL::Shared::Actions::CommonStructures {

    # Top
    method TOP($/) { make $/.values[0].made; }

    # workflow-command-list
    method workflow-commands-list($/) { make $/.values>>.made.join(";\n"); }

    # workflow-command
    method workflow-command($/) { make $/.values[0].made; }

	# Load data
	method data-load-command($/) { make $/.values[0].made; }
	method load-data-table($/) { make 'load data: ' ~ $<data-location-spec>.made; }
	method data-location-spec($/) { make '\"' ~ $/.Str ~ '\"'; }
	method use-data-table($/) { make 'use the data: ' ~ $<variable-name>.made; }

    # Split command
	method split-data-command($/) { make $/.values[0].made; }
    method split-data-simple($/) {
        if $<split-fraction> {
          make 'split into training and testing data with the proportion ' ~ $<split-fraction>.made;
        } else {
          make 'split the with the proportion 0.75';
        }
    }

    method split-data-spec($/) { make 'split data with ' ~ $<split-data-element-list>.made; }

    method split-data-element-list($/) { make $<split-data-element>>>.made.join(', '); }
    method split-data-element($/) { make $/.values[0].made; }

    method split-training-fraction($/)   { make 'training part ' ~ $<number-value>.made; }
    method split-validation-fraction($/) { make 'validation part ' ~ $<number-value>.made; }
    method split-method($/) {
        if $<proportional-adjective> {
            make 'proportional splitting method';
        } else {
            make 'random splitting method';
        }
    }
    method split-class-label-column($/) { make 'column with labels ' ~ $<variable-name>.made; }

    # Data summary command
    method data-summary-command($/) { make $/.values[0].made; }
    method data-summary-simple($/){ make 'summarize data'; }

    # Reduce dimension command
    method dimension-reduction-command($/) { make $/.values[0].made; }
    method dimension-reduction-simple($/){ make 'reduce dimension'; }

    # Make classifier command
    method make-classifier-command($/) { make $/.values[0].made; }
    method make-classifier-simple-command($/){
        if $<classifier-method-spec> {
            make 'train classifier with method: ' ~ $<classifier-method-spec>.Str;
        } else {
            make 'train classifier';
        }
    }
    method classifier-method-spec($/) { make $/.values[0].made; }

    # Classifier info command
    method classifier-info-command($/) { make $/.values[0].made; }
    method classifier-info-simple($/){ make 'show classifier information'; }

    # Classifier measurements command
    method classifier-measurements-command($/) { make $/.values[0].made; }
    method classifier-measurements-simple($/){ make 'show classifier measurements'; }

    # ROC curves command
    method roc-curves-command($/) { make $/.values[0].made; }
    method roc-curves-simple($/){ make 'show Receiver Operating Characteristics (ROC) diagram'; }


    # Pipeline command overwrites
    ## Object
    method assign-pipeline-object-to($/) { make 'assign the pipeline object to: ' ~ $/.values[0].made; }

    ## Value
    method assign-pipeline-value-to($/) { make  'assign the pipeline value to: ' ~ $/.values[0].made; }
    method take-pipeline-value($/) { make 'take the pipeline value'; }
    method echo-pipeline-value($/) { make 'show the pipeline value'; }
    method echo-pipeline-funciton-value($/) { make 'show the pipeline value transformed with: ' ~ $<pipeline-function-spec>.made; }

    ## Context
    method take-pipeline-context($/) { make 'take the context'; }
    method echo-pipeline-context($/) { make 'show the context'; }
    method echo-pipeline-function-context($/) { make 'show the context transformed with: ' ~ $<pipeline-function-spec>.made ~ ' )'; }

    ## Echo messages
    method echo-command($/) { make 'show the message: ' ~ $<echo-message-spec>.made; }

    ## Setup code
    method setup-code-command($/) {
        make 'SETUPCODE' => ''
    }
}
