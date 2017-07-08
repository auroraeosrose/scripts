#!/bin/sh

# This will build and test multiple versions of PHP
# that's a lot of work and can literally take hours, hurray for automation

# this a worktree layout with the names in version
# this will place builds into identical names into your PHP_BIN_ROOT

# this is where you're sticking the PHP binaries
[ -z $PHP_BIN_ROOT ] && PHP_BIN_ROOT=/usr/local
# this is the parent dir for your git checkouts
[ -z $PHP_SOURCE ] && PHP_SOURCE=./
# if you want to add something to all the PHP configurations do it here
[ -z $PHP_ADDL_CONFIG ] && PHP_ADDL_CONFIG=

# these are the configure flags for each type
PHP_ZTS_DEBUG="--enable-debug --enable-maintainer-zts"
PHP_ZTS="--enable-maintainer-zts"
PHP_DEBUG="--enable-debug"

# this makes it automated instead of waiting for you after a test run
export NO_INTERACTION=1

# Reduced down to just 7.1 plus - at this point I don't care about older stuff

for version in "php-src" "php-7.1"
do
    cd $PHP_SOURCE/$version

    make clean
    make distclean
    ./buildconf --force

    for type in -zts-debug -zts -debug ''
    do
        PRE="--without-pear --prefix=$PHP_BIN_ROOT/$version$type"

        if [ $type = "-zts-debug" ]; then
            CONFIG="$PRE $PHP_ZTS_DEBUG $PHP_ADDL_CONFIG"
        elif [ $type = "-zts" ]; then
            CONFIG="$PRE $PHP_ZTS $PHP_ADDL_CONFIG"
        elif [ $type = "-debug" ]; then
            CONFIG="$PRE $PHP_DEBUG $PHP_ADDL_CONFIG"
        else
            CONFIG="$PRE $PHP_ADDL_CONFIG"
        fi

        echo "Building PHP for $version in $type"
        echo "Configure is $CONFIG"
        ./configure $CONFIG
        make
        make test
        make install
        make clean

    done

done

