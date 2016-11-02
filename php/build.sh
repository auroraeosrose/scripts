#!/bin/sh

# This will build and test multiple versions of PHP
# that's a lot of work and can literally take hours, hurray for automation

# this expects my file layout

# this is where you're sticking the PHP binaries
[ -z $PHP_BIN_ROOT ] && PHP_BIN_ROOT=/usr/local/php
# this is the parent dir for your git checkouts
[ -z $PHP_SOURCE ] && PHP_SOURCE=/home/auroraeosrose/Documents/Code/github.com/php
# if you want to add something to all the PHP configurations do it here
[ -z $PHP_ADDL_CONFIG ] && PHP_ADDL_CONFIG=

# I have mine in /usr/local/bison
[ -z $OLD_BISON ] && OLD_BISON=/usr/local/bison/bin

# these are the configure flags for each type
PHP_ZTS_DEBUG="--enable-debug --enable-maintainer-zts"
PHP_ZTS="--enable-maintainer-zts"
PHP_DEBUG="--enable-debug"

# this makes it automated instead of waiting for you after a test run
export NO_INTERACTION=1

# You can fiddle with the list of available PHP's if you want
# This would be more elegant with bash 4 but alas ... there is centos (grumble)

for version in "master" "php-7.1" "php-7.0" "php-5.6"
do
    cd $PHP_SOURCE/$version

    if [ $version = "php-5.6" ]; then
        PATH=$OLD_BISON:$PATH
    fi

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

