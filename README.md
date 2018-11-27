# bashtest

An extremely minimalist testing framework for bash scripts.

## Use

Place `bashtest.sh` somewhere where your test script can source it.

```shell
#!/bin/bash

# Source bashtest, and pass it the title of your test suite
. bashtest.sh "My Application"

# Verify that the secrets binary exists
test "echo works on this box" \
"-n" "$(echo hello world)" # This can be any number of arguments. In this case, we are testing that the output of "echo hello world" is not empty.

summarize
```

### test

Usage: `test <description> [<arguments>...]`

Each argument in `<arguments>...` will be passed to a [unix test](https://en.wikipedia.org/wiki/Test_(Unix)) block.

### summarize

Place this command at the bottom of your test script. It outputs a summary of your tests, and exits `1` if any of them failed.