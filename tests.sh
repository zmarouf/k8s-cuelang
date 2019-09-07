#!/bin/sh

BATS=`which bats 2>&1 >/dev/null; echo $?`
test "$BATS" = 0 || echo "Install bats (OSX: brew install bats)"
#test "$BATS" = 0 || exit 1

echo -e "#### Testing setup\n"
bats tests/setup.bats

echo -e "\n#### Testing generation\n"
bats tests/generation.bats

echo -e "\n#### Testing validation\n"
bats tests/validation.bats