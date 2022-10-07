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

```shell
zef install DSL::English::ClassificationWorkflows
```

GitHub:

```shell
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

### Natural languages

```perl6
say $_.key, "\n", $_.value, "\n"  for ($_ => ToClassificationWorkflowCode($command, $_ ) for <Bulgarian English Russian>);
```

------------

## Command line interface

The package provides Command Line Interface (CLI) for its functionalities:

```shell
> ToClassificationWorkflowCode --help
# Usage:
#   ToClassificationWorkflowCode <command> [--target=<Str>] [--language=<Str>] [--format=<Str>] -- Translates natural language commands into (machine learning) classification workflow programming code.
#   ToClassificationWorkflowCode <target> <command> [--language=<Str>] [--format=<Str>] -- Both target and command as arguments.
#   
#     <command>           A string with one or many commands (separated by ';').
#     --target=<Str>      Target (programming language with optional library spec.) [default: 'WL-ClCon']
#     --language=<Str>    The natural language to translate from. [default: 'English']
#     --format=<Str>      The format of the output, one of 'automatic', 'code', 'hash', or 'raku'. [default: 'automatic']
#     <target>            Programming language.
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
