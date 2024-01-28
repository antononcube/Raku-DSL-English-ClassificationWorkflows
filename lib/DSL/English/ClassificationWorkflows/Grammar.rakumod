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
#   ʇǝu˙oǝʇsod@ǝqnɔuouoʇuɐ,
#   Windermere, Florida, USA.
#
#==============================================================================
#
#   For more details about Raku see https://raku.org/ .
#
#==============================================================================
=end comment

use DSL::Shared::Roles::PredicateSpecification;
use DSL::Shared::Roles::ErrorHandling;
use DSL::Entity::MachineLearning::Grammar::EntityNames;

use DSL::English::ClassificationWorkflows::Grammar::ClassificationPhrases;
use DSL::English::ClassificationWorkflows::Grammarish;

use DSL::Entity::MachineLearning::Grammar::EntityNames;

grammar DSL::English::ClassificationWorkflows::Grammar
        does DSL::English::ClassificationWorkflows::Grammarish
        does DSL::English::ClassificationWorkflows::Grammar::ClassificationPhrases
        does DSL::Entity::MachineLearning::Grammar::EntityNames
        does DSL::Shared::Roles::ErrorHandling
        does DSL::Shared::Roles::English::PipelineCommand {

    my DSL::Entity::MachineLearning::ResourceAccess $resources;

    method get-resources(--> DSL::Entity::MachineLearning::ResourceAccess) { return $resources; }
    method set-resources(DSL::Entity::MachineLearning::ResourceAccess $obj) { $resources = $obj; }


}
