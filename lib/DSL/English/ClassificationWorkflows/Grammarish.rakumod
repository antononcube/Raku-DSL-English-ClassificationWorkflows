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
#   ʇǝu˙ɐʇɐpopuǝɔɔɐ@ǝqnɔuouoʇuɐ,
#   Windermere, Florida, USA.
#
#==============================================================================
#
#   For more details about Raku see https://raku.org/ .
#
#==============================================================================
=end comment

role DSL::English::ClassificationWorkflows::Grammarish {

    # TOP
    rule TOP { <workflow-command> }

    # Workflow commands list
    rule workflow-commands-list { [ [ <.ws>? <workflow-command> <.ws>? ]+ % <.list-of-commands-separator> ] <.list-of-commands-separator>? }

    # Workflow command
    rule workflow-command {
        <pipeline-command> |
        <data-load-command> |
        <split-data-command> |
        <data-summary-command> |
        <dimension-reduction-command> |
        <classifier-ensemble-creation-command> |
        <make-classifier-command> |
        [ <classifier-query-command> || <classifier-measurements-command> || <classifier-testing-command> ] |
        <roc-plots-command> |
        <data-outliers-command>
    }

    # Load data
    rule data-load-command { <use-classifier-object> | <load-data-table> | <use-data-table> }
    rule data-location-spec { <dataset-name> }
    rule load-data-table { <.load-data-directive> <data-location-spec> }
    rule use-data-table { [ <.use-verb> | <.using-preposition> ] <.the-determiner>? <.data>? <variable-name> }
    rule use-classifier-object { [<.use-verb> | <.using-preposition>] <.the-determiner>? <.classifier-object-phrase> <variable-name> }

    # Split data command
    rule split-data-command { <split-data-spec> | <split-data-simple> }
    rule split-data-phrase { <.split-directive> <.the-determiner>? <.data> }
    rule split-data-simple { <.split-data-phrase> [ <.with-preposition> <.the-determiner>? <.split-adjective>? [ <.fraction-noun> | <.ratio-noun> ]? <split-fraction=.number-value> ]? }
    rule split-data-spec { <.split-data-phrase> <.with-preposition> <split-data-element-list> }
    rule split-data-element-list { <split-data-element>+ % [ <.list-separator> <.using-preposition>? | <.using-preposition> ] }
    rule split-data-element { <split-training-fraction> | <split-validation-fraction> | <split-method> }
    rule split-training-fraction { <.training-adjective>? <.data-noun>? <.split-verb>? [ <.fraction-noun> | <.ratio-noun> ]? <number-value> }
    rule split-validation-fraction { <.validation-adjective> <.data-noun>? [ <.fraction-noun> | <.ratio-noun> ]? <number-value> }
    rule split-method { <.method-noun>? [ <.class-noun>? <.label-noun>? <proportional-adjective> | <random-adjective> ] <.method-noun>? }
    rule split-class-label-column { <.class-noun>? <.label-noun> <variable-name> }

    # Data summary command
    rule data-summary-command { <data-summary-simple> }
    rule data-summary-simple { <data> <summary> }

    # Dimension reduction command
    rule dimension-reduction-command { <dimension-reduction-simple> }
    rule dimension-reduction-simple { <reduce-dimension-phrase> }

    # Make classifier command
    rule make-classifier-command { <make-classifier-simple-command> | <make-classifier-thorough-command> }

    ## Simple classifier creation
    rule make-classifier-simple-command {
        <.create-directive> <.a-determiner>? <.classifier-noun> <.using-preposition>? <.the-determiner>? <.classifier-method-phrase>? <classifier-method-spec>? |
        <.create-directive> <.a-determiner>? <classifier-method-spec> <.classifier-method-phrase>? }
    rule classifier-method-spec { <entity-classifier-name> | <mixed-quoted-variable-name> }
    rule classifier-method-phrase { <classifier-noun> | <classifiers-noun> | <method-noun> | <methods-noun> | <algorithm-noun> | <algorithms-noun> }

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

    # Make classifier ensemble command
    rule classifier-ensemble-creation-command { <ensemble-by-single-method-command> }
    rule ensemble-by-single-method-command { <.classifier-creation-opening>? <.classifier-ensemble-phrase> [ <ensemble-creation-num> | <ensemble-creation-simple> ] [ [ <.using-preposition> | <.and-conjunction> ] <resampling-spec> ]? }

    rule ensemble-creation-simple {
        <classifier-method-spec>? <.classifier-ensemble-phrase> |
        <.using-preposition> <classifier-method-spec> }

    rule ensemble-creation-num {
        [ <.using-preposition> | <.of-preposition> | <.with-preposition> ] <number-of-classifiers> <.of-preposition>? <classifier-method-spec> <.classifier-method-phrase>? }

    rule resampling-spec { <resampling-fraction-spec>? [ <.resampling-noun> | <.of-preposition> <.the-determiner>? <.data-noun> ] [ <.with-preposition> <resampling-function> ]?}

    rule resampling-function { 'RandomChoice' | 'RandomSample' }
    rule number-of-classifiers { <number-value> }
    rule resampling-fraction-spec { <percent-value> | <number-value> }

    # Classifier info commands
    rule classifier-query-command { <classifier-info-simple> | <classifier-get-info-property> | <classifier-info> | <classifier-counts> }

    rule classifier-info-simple { <classifier-info-phrase> }

    ## Get info property
    rule classifier-get-info-property { <.display-directive> <.classifier-noun> <classifier-property-list>}
    rule classifier-info { <.display-directive>? <.classifier-noun> [ <.info-noun> | <.information-noun> | <.stats-noun> | <.statistics-noun> ] }
    rule classifier-property-list { <entity-classifier-property-name>+ % <.list-separator> }

    ## (Ensemble counts)
    rule classifier-counts { [ <how-adverb> <many-determiner> | <what-pronoun> <number-of> ] <classifiers-noun> }

    # Classifier measurement command
    rule classifier-measurements-command { <classifier-measurements-simple> }
    rule classifier-measurements-openning { <display-directive>? <classifier-noun> <measurements-noun>? }
    rule classifier-measurements-simple { <classifier-measurements-openning> <classifier-measurements-list>? }
    rule classifier-measurements-list { <entity-classifier-measurement-name>+ % <.list-separator> }

    rule classifier-testing-command { <test-results> | <classifier-testing-simple> | <accuracies-by-variable-shuffling> }
    rule classifier-testing-simple { [ <test-verb> [ <a-determiner> | <the-determiner> ] ]? <classifier-noun> }
    rule test-results {
       <.test-results-preamble> [ <.test-verb> <.results-noun> | <test-measures-list> ] [ <.with-preposition>? <.the-determiner>? <test-classification-threshold> ]? <.test-results-filler>? }
    rule test-results-preamble { [ <compute-and-display> | <display-directive> ] <classifier-noun>? [ <measurement-noun> | <measurements-noun> ]? }
    rule test-classification-threshold{ <.classification-noun>? <.threshold-noun> <threshold=.number-value> [ <.of-preposition> | <.for-preposition> ] <class-label=.mixed-quoted-variable-name-or-wl-expr> }
    rule test-results-filler { <for-preposition>? <the-determiner>? <classifier-noun> | <over-preposition>? <the-determiner>? <available-adjective>? <test-verb>? <data-noun> }
    rule accuracies-by-variable-shuffling {
        <.compute-and-display> <.the-determiner>? [
        [ <.accuracies-noun> | <.accuracies-noun> ] <.with-preposition> [ <.variable-noun> | <.column-noun> ] <.shuffling-noun> |
        [ <.variable-noun> | <.column-noun> ]? <.shuffling-noun> [ <.accuracy-noun> | <.accuracies-noun> ] |
        <.variable-noun> <.importance-noun> <.estimates-noun>?
        ] }
    rule test-measures-list { <entity-classifier-measurement-name>+ % <.list-separator> }

    # ROC plot command
    rule roc-plots-command { <roc-diagrams-command> | <roc-curves-simple> }
    rule roc-curves-simple { <display-directive>? [ <roc-phrase> | <rocs-phrase> ] <plots-noun>? }
    rule roc-diagrams-command { [ <.display-directive> <.roc-diagram-phrase> | <.roc-curves-simple> ] [ [ <.using-preposition> | <.of-preposition> ] <roc-functions-list> ]? }
    rule roc-diagram-phrase { <.list-line-roc-diagram-phrase> | [ <.list-line-diagram-phrase> | <.diagram-phrase> ] }
    rule list-line-roc-diagram-phrase { <list-noun>? <line-noun> <roc-curve-phrase> <diagram-phrase> }
    rule list-line-diagram-phrase { <list-noun>? <line-noun> <diagram-phrase> | 'ListLinePlot' }
    rule roc-functions-list { <roc-function>+ % [ <.list-separator> | <.versus-preposition> ] }

    # Data outliers command
    rule data-outliers-command { <find-outliers-command> | <remove-outliers-command> | <show-outliers-command> }
    rule find-outliers-command { <find-outliers-per-class> | <find-outliers-all> }
    rule find-outliers-all { <find-directive> <outliers-spec> }
    rule find-outliers-per-class { [ <.find-directive> | <.compute-and-display>] <outliers-spec> <.per-preposition> <.class-label-phrase> }
    rule remove-outliers-command { <remove-directive> <outliers-spec>}
    rule show-outliers-command { <display-directive> <outliers-spec> }
    rule outliers-spec { <.the-determiner>? <.data-noun>? <outliers-type>? <.outliers-noun> }
    rule outliers-type { <top-noun> | <bottom-noun> | <largest-adjective> | <smallest-adjective> | <all-determiner> }
}
