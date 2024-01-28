# DSL::English::ClassificationWorkflows (Raku package)

## In brief

This Raku (Perl 6) package has grammar classes and action classes for the parsing and
interpretation of natural Domain Specific Language (DSL) commands that specify classification workflows.

The interpreters (actions) target different programming languages: Python, R, Raku, Wolfram Language (WL), and others.
Also, different natural languages.

Currently, the generated pipelines are for the software monad
["ClCon"](https://github.com/antononcube/MathematicaForPrediction/blob/master/MonadicProgramming/MonadicContextualClassification.m)
implemented in WL, [AAp1], and WL's built-in commands.

**Remark:** "ClCon" stands for "Classification using a Context". 

**Remark:** "WL" stands for "Wolfram Language". "Mathematica" and "WL" are used as synonyms.

------------

## Installation

Zef ecosystem:

```
zef install DSL::English::ClassificationWorkflows
```

GitHub:

```
zef install https://github.com/antononcube/Raku-DSL-English-ClassificationWorkflows.git
```

------------

## Examples

### Programming languages

Here is a simple invocation:

```perl6
use DSL::English::ClassificationWorkflows;

ToClassificationWorkflowCode('make a logistic regression classifier', 'WL::ClCon');
```
```
# ClConMakeClassifier[ "LogisticRegression" ]
``` 

Here is a more complicated pipeline specification used to generate the code
for two WL classification systems:

```perl6
my $command = q:to/END/;
use dfTitanic;
split the data with ratio 0.73;
create a logistic regression classifier;
show precision and recall;
show top confusions, misclassified examples, least certain examples;
show ROC plots;
END

say $_.key, "\n", $_.value, "\n"  for ($_ => ToClassificationWorkflowCode($command, $_ ) for <WL::ClCon WL::System>);
```
```
# WL::ClCon
# ClConUnit[ dfTitanic ] \[DoubleLongRightArrow]
# ClConSplitData[ "TrainingFraction" -> 0.73 ] \[DoubleLongRightArrow]
# ClConMakeClassifier[ "LogisticRegression" ] \[DoubleLongRightArrow]
# ClConClassifierMeasurements[ {"Precision", "Recall"} ] \[DoubleLongRightArrow] ClConEchoValue[] \[DoubleLongRightArrow]
# ClConClassifierMeasurements[ {"TopConfusions", "MisclassifiedExamples", "LeastCertainExamples"} ] \[DoubleLongRightArrow] ClConEchoValue[] \[DoubleLongRightArrow]
# ClConROCPlot[]
# 
# WL::System
# data = ClConToNormalClassifierData @ dfTitanic;
# {dataTraining, dataTesting} = TakeDrop[ RandomSample[data], Floor[ 0.73 * Length[data] ] ];
# dataValidation = Automatic;
# clObj = Classify[ dataTraining, Method -> "LogisticRegression", ValidationSet -> dataValidation ];
# Echo @ ClassifierMeasurements[clObj, dataTesting, {"Precision", "Recall"} ];
# Echo @ ClassifierMeasurements[clObj, dataTesting, {"TopConfusions", "MisclassifiedExamples", "LeastCertainExamples"} ];
# Echo @ ROCPlot[]
```

### Natural languages

```perl6
say $_.key, "\n", $_.value, "\n"  for ($_ => ToClassificationWorkflowCode($command, $_ ) for <Bulgarian English Russian>);
```
```
# Bulgarian
# използвай данните: dfTitanic 
# раздели данните с тренировъчна част 0.73 
# тренирай класификатор с метод: logistic regression  
# изчисли следните мерки на класификатора: "Precision", "Recall" 
# изчисли следните мерки на класификатора: "TopConfusions", "MisclassifiedExamples", "LeastCertainExamples" 
# покажи диаграма с приемателните операционни характеристики (ROC)
# 
# English
# use the data: dfTitanic 
# split data with training part 0.73 
# train classifier with method: logistic regression  
# compute the classifier measures: "Precision", "Recall" 
# compute the classifier measures: "TopConfusions", "MisclassifiedExamples", "LeastCertainExamples" 
# show Receiver Operating Characteristics (ROC) diagram
# 
# Russian
# использовать данные: dfTitanic 
# разделить данные с тренировочная часть 0.73 
# обучить классификатор методом: logistic regression  
# вычислить следующие показатели классификатора: "Precision", "Recall" 
# вычислить следующие показатели классификатора: "TopConfusions", "MisclassifiedExamples", "LeastCertainExamples" 
# показать диаграмму рабочих характеристик приемника (RХП)
```

------------

## Command line interface

The package provides Command Line Interface (CLI) for its functionalities:

```shell
ToClassificationWorkflowCode --help
```
```
# Translates natural language commands into classification programming code.
# Usage:
#   ToClassificationWorkflowCode <command> [--target=<Str>] [--language=<Str>] [--format=<Str>] [-c|--clipboard-command=<Str>] -- Translates natural language commands into (machine learning) classification workflow programming code.
#   ToClassificationWorkflowCode <target> <command> [--language=<Str>] [--format=<Str>] [-c|--clipboard-command=<Str>] -- Both target and command as arguments.
#   ToClassificationWorkflowCode [<words> ...] [-t|--target=<Str>] [-l|--language=<Str>] [-f|--format=<Str>] [-c|--clipboard-command=<Str>] -- Command given as a sequence of words.
#   
#     <command>                       A string with one or many commands (separated by ';').
#     --target=<Str>                  Target (programming language with optional library spec.) [default: 'WL-ClCon']
#     --language=<Str>                The natural language to translate from. [default: 'English']
#     --format=<Str>                  The format of the output, one of 'automatic', 'code', 'hash', or 'raku'. [default: 'automatic']
#     -c|--clipboard-command=<Str>    Clipboard command to use. [default: 'Whatever']
#     <target>                        Programming language.
#     [<words> ...]                   Words of a data query.
#     -t|--target=<Str>               Target (programming language with optional library spec.) [default: 'WL::ClCon']
#     -l|--language=<Str>             The natural language to translate from. [default: 'English']
#     -f|--format=<Str>               The format of the output, one of 'automatic', 'code', 'hash', or 'raku'. [default: 'automatic']
# Details:
#     If --clipboard-command is the empty string then no copying to the clipboard is done.
#     If --clipboard-command is 'Whatever' then:
#         1. It is attempted to use the environment variable CLIPBOARD_COPY_COMMAND.
#             If CLIPBOARD_COPY_COMMAND is defined and it is the empty string then no copying to the clipboard is done.
#         2. If the variable CLIPBOARD_COPY_COMMAND is not defined then:
#             - 'pbcopy' is used on macOS
#             - 'clip.exe' on Windows
#             - 'xclip -sel clip' on Linux.
```

------------

## Versions

The original version of this Raku package was developed/hosted at
[ [AAp2](https://github.com/antononcube/ConversationalAgents/tree/master/Projects/ClassficationWorkflowsAgent) ].

A dedicated GitHub repository was made in order to make the installation with Raku's `zef` more direct.
(As shown above.)

------------

## References

[AAp1] Anton Antonov,
[Monadic contextual classification Mathematica package](https://github.com/antononcube/MathematicaForPrediction/blob/master/MonadicProgramming/MonadicContextualClassification.m),
(2017-2022),
[MathematicaForPrediction at GitHub](https://github.com/antononcube/MathematicaForPrediction).

[AAp2] Anton Antonov,
["Classification workflows conversational agent"](https://github.com/antononcube/ConversationalAgents/tree/master/Projects/ClassficationWorkflowsAgent),
(2017),
[ConversationalAgents at GitHub](https://github.com/antononcube/ConversationalAgents).
