#! /bin/zsh

# This script is expected to be executed in the "top directory" Raku-DSL-English-ClassificationWorkflows

cd ./lib/DSL/English/ClassificationWorkflows/Grammar

echo 'ClassificationPhrases-template'
AddFuzzyMatching -o=./ClassificationPhrases.rakumod --add-protos --add-exclusions --sym-name=English ./ClassificationPhrases-template

#echo 'ClassifierMeasurements-template'
#AddFuzzyMatching -o=./ClassifierMeasurements.rakumod --add-protos --add-exclusions --sym-name=English ./ClassifierMeasurements-template

#echo 'ClassifierProperties-template'
#AddFuzzyMatching -o=./ClassifierProperties.rakumod --add-protos --add-exclusions --sym-name=English ./ClassifierProperties-template

cd ../../../../../
