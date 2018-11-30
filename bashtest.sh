#!/bin/bash
GREEN="\e[32m"
RED="\e[31m"
NOFORMAT="\e[0m"
BOLD="\e[1m"

TOTAL_FAILURES=0
TOTAL_SUCCESSES=0
declare -a FAILURES

echo -e "${NOFORMAT}${BOLD}$1${NOFORMAT}"

# Usage: test <description> ...<arguments>
test () {
    MSG="$1"
    shift

    if [ "$@" ];
    then
        echo -e "${GREEN}- [✓] $MSG${NOFORMAT}"
        TOTAL_SUCCESSES=$((TOTAL_SUCCESSES + 1))
    else
        echo -e "${RED}- [x] $MSG${NOFORMAT}"
        FAILURES[TOTAL_FAILURES]="$@"
        TOTAL_FAILURES=$((TOTAL_FAILURES + 1))
    fi
}

# Outputs a summary of test results, exits non-0 if there are any failures
summarize () {
    MSG="$TOTAL_SUCCESSES / $((TOTAL_SUCCESSES + TOTAL_FAILURES)) Tests Passing${NOFORMAT}"
    echo -e "\n"
    if [ $TOTAL_FAILURES -ne 0 ]
    then
        echo -e "${RED}Oh No!\n$MSG"
        for failure in ${farm_hosts[@]}; do
            echo $failure
        done
        exit 1
    else
        echo -e "${GREEN}Success!\n$MSG"
    fi
}