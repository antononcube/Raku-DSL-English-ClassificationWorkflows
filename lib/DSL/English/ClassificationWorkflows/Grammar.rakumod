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

use DSL::Shared::Roles::PredicateSpecification;
use DSL::Shared::Roles::ErrorHandling;

use DSL::English::ClassificationWorkflows::Grammar::ClassificationPhrases;
use DSL::English::ClassificationWorkflows::Grammar::ROCFunctions;
use DSL::English::ClassificationWorkflows::Grammar::ClassifierProperties;
use DSL::English::ClassificationWorkflows::Grammar::ClassifierMeasurements;

grammar DSL::English::ClassificationWorkflows::Grammar
        does DSL::Shared::Roles::ErrorHandling
        does DSL::English::ClassificationWorkflows::Grammar::ClassificationPhrases
        does DSL::English::ClassificationWorkflows::Grammar::ROCFunctions
        does DSL::English::ClassificationWorkflows::Grammar::ClassifierProperties
        does DSL::English::ClassificationWorkflows::Grammar::ClassifierMeasurements {
    # TOP
    rule TOP {
        <pipeline-command> |
        <data-load-command> |
        <split-data-command> |
        <data-summary-command> |
        <dimension-reduction-command> |
        <make-classifier-command> |
        [ <classifier-measurements-command> || <classifier-testing-command> ] |
        <classifier-query-command> |
        <roc-plots-command>
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
    rule split-training-fraction { <.training-adjective>? <.data-noun>? <.fraction-noun>? <number-value> }
    rule split-validation-fraction { <.validation-adjective> <.data-noun>? <.fraction-noun>? <number-value> }
    rule split-method { <.method-noun> [ <.class-noun>? <.label-noun>? <proportional-adjective> | <random-adjective> ] }
    rule split-class-label-column { <.class-noun>? <.label-noun> <variable-name> }

    # Data summary command
    rule data-summary-command { <data-summary-simple> }
    rule data-summary-simple { <data> <summary> }

    # Dimension reduction command
    rule dimension-reduction-command { <dimension-reduction-simple> }
    rule dimension-reduction-simple { <reduce-dimension-phrase> }

    # Make classifier command
    rule make-classifier-command { <make-classifier-simple> | <make-classifier-thorough-command> }

    ## Simple classifier creation
    rule make-classifier-simple {
        <.create-directive> <.a-determiner>? <.classifier-noun> <.using-preposition>? <classifier-method-spec>? |
        <.create-directive> <.a-determiner>? <classifier-method-spec> <.classifier-noun> }
    rule classifier-method-spec { <wl-classifier-name> | <mixed-quoted-variable-name> }

    ## More thorough classifier creation
    rule make-classifier-thorough-command {
        <.classifier-creation-opening> [
        <classifier-algorithm-spec>? <.classifier-noun>? [ <.using-preposition> <library-name> ]? |
        <.classifier-noun> <.using-preposition> <classifier-algorithm-spec> ]
        [ <.using-preposition> <train-data-spec> ]? }
    rule classifier-creation-opening { [ <create-directive> | <train-verb> ] <a-determiner>? }
    rule classifier-algorithm-spec { <classifier-method-spec> [ [ <.from-preposition> | <.of-preposition> ] <library-name> ]?}
    rule library-name { <mixed-quoted-variable-name> }
    rule train-data-spec { [ <number-value> <.fraction-noun> | <percent-value> ] [ <.of-preposition> <.the-determiner>? <.available-adjective>? [ <records-phrase> | <data-noun> ]]}

    # Classifier info commands
    rule classifier-query-command { <classifier-info-simple> | <classifier-get-info-property> | <classifier-info> | <classifier-counts> }

    rule classifier-info-simple { <classifier-info-phrase> }

    ## Get info property
    rule classifier-get-info-property { <.display-directive> <.classifier-noun> <classifier-property-list>}
    rule classifier-info { <.display-directive>? <.classifier-noun> [ <.info-noun> | <.information-noun> | <.stats-noun> | <.statistics-noun> ] }
    rule classifier-property-list { <wl-classifier-info-property>+ % <.list-separator> }

    ## (Ensemble counts)
    rule classifier-counts { [ <how-adverb> <many-determiner> | <what-pronoun> <number-of> ] <classifiers-noun> }

    # Classifier measurement command
    rule classifier-measurements-command { <classifier-measurements-simple> }
    rule classifier-measurements-openning { <display-directive>? <classifier-noun> <measurements-noun>? }
    rule classifier-measurements-simple{ <classifier-measurements-openning> <classifier-measurements-list>? }
    rule classifier-measurements-list { <wl-classifier-measurement>+ % <.list-separator> }

    rule classifier-testing-command { <test-results> | <classifier-testing-simple> | <accuracies-by-variable-shuffling> }
    rule classifier-testing-simple { [ <test-verb> [ <a-determiner> | <the-determiner> ] ]? <classifier-noun> }
    rule test-results {
       <.test-results-preamble> [ <.test-verb> <.results-noun> | <test-measures-list> ] [ <.with-preposition>? <.the-determiner>? <test-classification-threshold> ]? <.test-results-filler>? }
    rule test-results-preamble { [ <compute-and-display> | <display-directive> ] <classifier-noun>? [ <measurement-noun> | <measurements-noun> ]? }
    rule test-classification-threshold { <.classification-noun>? <.threshold-noun> <threshold=.number-value> [ <.of-preposition> | <.for-preposition> ] <class-label=.mixed-quoted-variable-name-or-wl-expr> }
    rule test-results-filler { <for-preposition>? <the-determiner>? <classifier-noun> | <over-preposition>? <the-determiner>? <available-adjective>? <test-verb>? <data-noun> }
    rule accuracies-by-variable-shuffling {
        <.compute-and-display> <.the-determiner>? [
        [ <.accuracies-noun> | <.accuracies-noun> ] <.with-preposition> [ <.variable-noun> | <.column-noun> ] <.shuffling-noun> |
        [ <.variable-noun> | <.column-noun> ]? <.shuffling-noun> [ <.accuracy-noun> | <.accuracies-noun> ] |
        <.variable-noun> <.importance-noun> <.estimates-noun>?
        ] }
    rule test-measures-list { <wl-classifier-measurement>+ % <.list-separator> }

    # ROC plot command
    rule roc-plots-command { <roc-diagrams-command> | <roc-curves-simple> }
    rule roc-curves-simple { <display-directive>? [ <roc-phrase> | <rocs-phrase> ] <plots-noun>? }
    rule roc-diagrams-command { [ <.display-directive> <.roc-diagram-phrase> | <.roc-curves-simple> ] [ [ <.using-preposition> | <.of-preposition> ] <roc-functions-list> ]? }
    rule roc-diagram-phrase { <.list-line-roc-diagram-phrase> | [ <.list-line-diagram-phrase> | <.diagram-phrase> ] }
    rule list-line-roc-diagram-phrase { <list-noun>? <line-noun> <roc-curve-phrase> <diagram-phrase> }
    rule list-line-diagram-phrase { <list-noun>? <line-noun> <diagram-phrase> | 'ListLinePlot' }
    rule roc-functions-list { <roc-function>+ % [ <.list-separator> | <.versus-preposition> ] }
}
