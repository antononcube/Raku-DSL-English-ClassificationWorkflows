=begin comment
#==============================================================================
#
#   Classification Workflows Bulgarian DSL actions in Raku (Perl 6)
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
#   ʇǝu˙ɐʇɐpopuǝɔɔɐ@ǝqnɔuouoʇuɐ,
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

unit module DSL::English::ClassificationWorkflows::Actions::Bulgarian::Standard;

class DSL::English::ClassificationWorkflows::Actions::Bulgarian::Standard
        is DSL::Shared::Actions::CommonStructures {

    # Top
    method TOP($/) { make $/.values[0].made; }

    # workflow-command-list
    method workflow-commands-list($/) { make $/.values>>.made.join(";\n"); }

    # workflow-command
    method workflow-command($/) { make $/.values[0].made; }

	# Load data
	method data-load-command($/) { make $/.values[0].made; }
	method load-data-table($/) { make 'зареди данните: ' ~ $<data-location-spec>.made; }
	method data-location-spec($/) { make '\"' ~ $/.Str ~ '\"'; }
	method use-data-table($/) { make 'използвай данните: ' ~ $<variable-name>.made; }

    # Split command
	method split-data-command($/) { make $/.values[0].made; }
    method split-data-simple($/) {
        if $<split-fraction> {
          make 'раздели данните с пропорцията ' ~ $<split-fraction>.made;
        } else {
          make 'раздели данните с пропорцията 0.75';
        }
    }

    method split-data-spec($/) { make 'раздели данните с ' ~ $<split-data-element-list>.made; }

    method split-data-element-list($/) { make $<split-data-element>>>.made.join(', '); }
    method split-data-element($/) { make $/.values[0].made; }

    method split-training-fraction($/)   { make 'тренировачна част ' ~ $<number-value>.made; }
    method split-validation-fraction($/) { make 'валидираща част ' ~ $<number-value>.made; }
    method split-method($/) {
        if $<proportional-adjective> {
            make 'пропорционален метод на разделяне';
        } else {
            make 'случаен метод на разделяне';
        }
    }
    method split-class-label-column($/) { make 'колона с етикети ' ~ $<variable-name>.made; }

    # Data summary command
    method data-summary-command($/) { make $/.values[0].made; }
    method data-summary-simple($/){ make 'опиши данните'; }

    # Reduce dimension command
    method dimension-reduction-command($/) { make $/.values[0].made; }
    method dimension-reduction-simple($/){ make 'намали размерността'; }

    # Make classifier command
    method make-classifier-command($/) { make $/.values[0].made; }
    method make-classifier-simple-command($/){
        if $<classifier-method-spec> {
            make 'тренирай класификатор с метод: ' ~ $<classifier-method-spec>.Str;
        } else {
            make 'тренирай класификатор';
        }
    }
    method classifier-method-spec($/) { make $/.values[0].made; }

    # Classifier info command
    method classifier-info-command($/) { make $/.values[0].made; }
    method classifier-info-simple($/){ make 'покажи информация за класификатора'; }

    # Classifier measurements command
    method classifier-measurements-command($/) { make $/.values[0].made; }
    method classifier-measurements-simple($/){ make 'покажи мерки на класификатора'; }

    # ROC curves command
    method roc-curves-command($/) { make $/.values[0].made; }
    method roc-curves-simple($/){ make 'покажи диаграма с приемателните операционни характеристики (ROC)'; }


    # Pipeline command overwrites
    ## Object
    method assign-pipeline-object-to($/) { make 'присвои лентовия обект на: ' ~ $/.values[0].made; }

    ## Value
    method assign-pipeline-value-to($/) { make  'присвои лентовата стойност на: ' ~ $/.values[0].made; }
    method take-pipeline-value($/) { make 'вземи лентовата стойност'; }
    method echo-pipeline-value($/) { make 'покажи лентовата стойност'; }
    method echo-pipeline-funciton-value($/) { make 'покажи лентовата стойност трансформирана с: ' ~ $<pipeline-function-spec>.made; }

    ## Context
    method take-pipeline-context($/) { make 'вземи контекста'; }
    method echo-pipeline-context($/) { make 'покажи контекста'; }
    method echo-pipeline-function-context($/) { make 'покажи контекста трансформиран с: ' ~ $<pipeline-function-spec>.made ~ ' )'; }

    ## Echo messages
    method echo-command($/) { make 'покажи съобщението: ' ~ $<echo-message-spec>.made; }

    ## Setup code
    method setup-code-command($/) {
        make 'SETUPCODE' => ''
    }
}
