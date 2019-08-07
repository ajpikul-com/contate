# Contate

**Contate** parses files for arbitrarily placed shebang!s (`#!`) and substitutes the script output into the document.

## Example 

It looks for

```
...Static content...
#!/bin/bash
echo "Some script output"
#!
...More static content...
```
And gives you:

```
...Static content...
Some script output
...More static content...
```

## Installation

`make all` will output the script to `build/`, so `build/contate` is the most recent version. Once it is running, it exports a function called "contate" to call itself, so it doesn't necessarily need to be in `$PATH`.

## Usage

Contate targets by default must have a `.contate` ending and they will be output without it.

`contate [OPTIONS] targets...`

If target contains directories, you must specify `-r`.
`-o` to specify the output _folder_ or `-` for stdout (default)
`-d` for dry run which skips actual file parsing.
`-q` is intended to silence all output
`-p` will replace the selection POSIX regex pattern. The default is: `(.*).contate$` where the capture group is the output path (placed on-top of that specified by `-o`)

# TODO:

* util_test
* main_test (split main into init and recurse functions first)
* contator_test (split parsing state machine into state functions first)
* make examples legible and demonstrative- a contate github.io maybe
* maybe thing about portability/porting entirely
* usage
* improve q and d and p
