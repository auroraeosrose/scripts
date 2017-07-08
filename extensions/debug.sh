#!/bin/sh

# helper to run our current extension tests with valgrind and leak checking on

# this makes it automated instead of waiting for you after a test run
export NO_INTERACTION=1

[ -z $PHP_BIN_ROOT ] && PHP_BIN_ROOT=/usr/local/php
[ -z $EXT_SOURCE ] && EXT_SOURCE=.

export TEST_PHP_ARGS = "-m"

CXXFLAG

cd $PHP_EOS_ROOT/$extension

make clean
make distclean

for version in "php-src" "php-7.1"
do
    for type in -lcov -zts-debug -debug ''
    do
        echo "Building extension for $version in $type"

        $PHP_BIN_ROOT/$version$type/bin/phpize

        ./configure --coverage --fprofile-arcs -ftest-coverage --with-php-config=$PHP_BIN_ROOT/$version$type/bin/php-config

        make
        make test
    done
done