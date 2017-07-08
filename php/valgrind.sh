#!/bin/sh

# This will run php tests with leak detection and valgrind on
# for already compiled debug and zts-debug
# this can still take forever

# this is where your PHP binaries are
[ -z $PHP_BIN_ROOT ] && PHP_BIN_ROOT=/usr/local
# this is the parent dir for your git checkouts
[ -z $PHP_SOURCE ] && PHP_SOURCE=./

# this makes it automated instead of waiting for you after a test run
export NO_INTERACTION=1

# Reduced down to just 7.1 plus - at this point I don't care about older stuff

for version in "php-src" "php-7.1"
do
    cd $PHP_SOURCE/$version

    for type in -zts-debug -debug
    do
       export TEST_PHP_EXECUTABLE=$PHP_BIN_ROOT/$version$type/bin/php

       echo $TEST_PHP_EXECUTABLE

       $TEST_PHP_EXECUTABLE run-tests.php -m 

    done

done