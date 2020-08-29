=begin comment
#==============================================================================
#
#   Classification workflows grammar in Raku
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
#   For more details about Raku see https://raku.org/ .
#
#==============================================================================
=end comment

use v6;

use DSL::Shared::Roles::English::CommonParts;
use DSL::Shared::Roles::English::PipelineCommand;
use DSL::Shared::Roles::PredicateSpecification;
use DSL::Shared::Roles::ErrorHandling;

use DSL::English::ClassificationWorkflows::Grammar::ClassificationPhrases;

grammar DSL::English::ClassificationWorkflows::Grammar
        does DSL::Shared::Roles::ErrorHandling
        does DSL::English::ClassificationWorkflows::Grammar::ClassificationPhrases
        does DSL::Shared::Roles::English::PipelineCommand {
    # TOP
    rule TOP {
        <pipeline-command> |
        <data-load-command> |
        <split-data-command> |
        <data-summary-command> |
        <dimension-reduction-command> |
        <make-classifier-command> |
        <classifier-info-command> |
        <classifier-measurements-command> |
        <roc-curves-command>
    }

    # Load data
    rule data-load-command { <load-data-table> | <use-data-table> }
    rule data-location-spec { <dataset-name> }
    rule load-data-table { <.load-data-directive> <data-location-spec> }
    rule use-data-table { [ <.use-verb> | <.using-preposition> ] <.the-determiner>? <.data>? <variable-name> }

    # Split data command
    rule split-data-command { <split-data-spec> | <split-data-simple> }
    rule split-data-phrase { <.split-directive> <.the-determiner>? <.data> }
    rule split-data-simple { <.split-data-phrase> [ <.with-preposition> <.the-determiner>? <.fraction-noun>? <split-fraction=.number-value> ]? }
    rule split-data-spec { <.split-data-phrase> <.with-preposition> <split-data-element-list> }
    rule split-data-element-list { <split-data-element>+ % <.list-separator> }
    rule split-data-element { <split-training-fraction> | <split-testing-fraction> | <split-validation-fraction> | <split-method> }
    rule split-training-fraction { <.training-adjective>? <.fraction-noun>? <number-value> }
    rule split-validation-fraction { <.validation-adjective> <.fraction-noun>? <number-value> }
    rule split-method { <.method-noun> [ <.class-noun>? <.label-noun>? <proportional-adjective> | <random-adjective> ] }
    rule split-class-label-column { <.class-noun>? <.label-noun> <variable-name> }

    # Data summary command
    rule data-summary-command { <data-summary-simple> }
    rule data-summary-simple { <data> <summary> }

    # Dimension reduction command
    rule dimension-reduction-command { <dimension-reduction-simple> }
    rule dimension-reduction-simple { <reduce-dimension-phrase> }

    # Make classifier command
    rule make-classifier-command { <make-classifier-simple> }
    rule make-classifier-simple { <create-directive> <classifier-noun> }

    # Classifier info commands
    rule classifier-info-command { <classifier-info-simple> }
    rule classifier-info-simple { <classifier-info-phrase> }

    # Classifier measurement command
    rule classifier-measurements-command { <classifier-measurements-simple> }
    rule classifier-measurements-simple { <classifier-noun> <measurements-noun> }

    # ROC curves command
    rule roc-curves-command { <roc-curves-simple> }
    rule roc-curves-simple { <display-directive>? <roc-phrase> }

}
