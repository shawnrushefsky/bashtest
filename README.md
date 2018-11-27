# bashtest

An extremely minimalist testing framework for bash scripts.

## Use

Use gitmodules to install bashtest:

```shell
git submodule add git@github.com:shawnrushefsky/bashtest.git
```

Then source it in your test file

```shell
#!/bin/bash

# Source bashtest, and pass it the title of your test suite
. bashtest/bashtest.sh "My Application"

# test some sort of function
test "echo works on this box" \
"-n" "$(echo hello world)" # This can be any number of arguments. In this case, we are testing that the output of "echo hello world" is not empty.

summarize
```

You'll see an output like:

```
My Application
- [✓] echo works on this box

Success!
1 / 1 Tests Passing
```

Your script will exit 0 if all tests pass, and exit 1 if any tests fail.

### test

Usage: `test <description> [<arguments>...]`

Each argument in `<arguments>...` will be passed to a [unix test](https://en.wikipedia.org/wiki/Test_(Unix)) block.

### summarize

Place this command at the bottom of your test script. It outputs a summary of your tests, and exits `1` if any of them failed.
