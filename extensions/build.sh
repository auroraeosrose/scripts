#!/bin/sh

# this makes it automated instead of waiting for you after a test run
export NO_INTERACTION=1

[ -z $PHP_BIN_ROOT ] && PHP_BIN_ROOT=/usr/local/php
[ -z $PHP_EOS_ROOT ] && PHP_EOS_ROOT=/home/auroraeosrose/Documents/Code/github.com/eosforphp

# Walk all our current eos extensions
for extension in "structures"
do
    # build each PHP version and go
    cd $PHP_EOS_ROOT/$extension

    make clean
    make distclean

    for version in "php-src" "php-7.1"
    do
     for type in -lcov -zts-debug -zts -debug ''
        do
            echo "Building extension for $version in $type"

            $PHP_BIN_ROOT/$version$type/bin/phpize

            ./configure --with-php-config=$PHP_BIN_ROOT/$version$type/bin/php-config

            if [ $type = "-lcov" ]; then
                MAKE="make lcov"
            else
                MAKE="make test"
            fi

            make
            $MAKE
            make install
            make clean

        done
    done

done