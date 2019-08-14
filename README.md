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

* If target contains directories, you must specify `-r`.
* `-o` to specify the output _folder_ or `-o -` for stdout (default) (SEE NOTE)
* `-d` for dry run which skips actual file parsing.
* `-q` is intended to silence all output
* `-p` will replace the selection POSIX regex pattern. The default is: `(.*).contate$` where the capture group is the output path (placed on-top of that specified by `-o`)

NOTE: Contate exports its options as env vars so contate-subprocesses can use them. Therefore, setting output explicitly to stdout when using `contate` in `*.contate` files is wise.

You are **NOT** limited to bash scripts.

You have inline bash scripts: `#!$(command)!#`

You can escape shebangs: `##!/this/is/static`


### Cross-script variables

The bash provides an env var which is a key->value list. From bash, you can use:

* `d_set key val` sets the key to val
* `d_get key` echos the val
* `d_exists key` exits normally if it exists, otherwise exit status 1
* `d_del key` always succeeds

Access in more languages is coming.

# TODO:

* util_test
* main_test (split main into init and recurse functions first)
* contator_test (split parsing state machine into state functions first)
* make examples legible and demonstrative- a contate github.io maybe
* maybe thing about portability/porting entirely
* usage
* improve q and d and p
* allow c to take any file and strike directories since it's not working
* strip .contate from dir suffix?
* echo on a empty inline produced no line wtf
