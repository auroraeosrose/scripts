#!/bin/sh

# This will build multiple versions of PHP, run tests
# and generate lcov information

# this doesn't actually install anything though

# this is where you're sticking the PHP binaries
[ -z $PHP_BIN_ROOT ] && PHP_BIN_ROOT=/usr/local
# this is the parent dir for your git checkouts
[ -z $PHP_SOURCE ] && PHP_SOURCE=./
# if you want to add something to all the PHP configurations do it here
[ -z $PHP_ADDL_CONFIG ] && PHP_ADDL_CONFIG=

# this makes it automated instead of waiting for you after a test run
export NO_INTERACTION=1

# Reduced down to just 7.1 plus - at this point I don't care about older stuff

for version in "php-src" "php-7.1"
do
    cd $PHP_SOURCE/$version

    make clean
    make distclean
    ./buildconf --force

    PRE="--without-pear --prefix=$PHP_BIN_ROOT/$version-lcov"

    echo "Building PHP Code coverage for $version"
    ./configure $PRE --enable-gcov
    make lcov

done

