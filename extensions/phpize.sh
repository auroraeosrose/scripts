#!/bin/sh

# This will build and test an extension in multiple builds of PHP

# this expects multiple php installs in /usr/local/php

# this is where the php binaries are
[ -z $PHP_BIN_ROOT ] && PHP_BIN_ROOT=/usr/local/php

# this is the location of the PHP extension you want to build
[ -z $EXT_SOURCE ] && EXT_SOURCE=.

# this allows you to build only PHP 5 or 7
[ -z $ONLY_5 ] && ONLY_5=0
[ -z $ONLY_7 ] && ONLY_7=0

# this makes it automated instead of waiting for you after a test run
export NO_INTERACTION=1

# You can fiddle with the list of available PHP's if you want
# This would be more elegant with bash 4 but alas ... there is centos (grumble)

for version in "master" "php-7.1" "php-7.0" "php-5.6"
do
    if [ $ONLY_5 = 1 ] && [ $version !="php-5.6" ]; then
        echo "Only doing php 5"
        continue;
    fi

    if [ $ONLY_7 = 1 ] && [ $version = "php-5.6" ]; then
        echo "Skipping PHP 5"
        continue;
    fi

    cd $EXT_SOURCE

    # todo - cleverness in version branch naming

    make clean

    for type in -zts-debug -zts -debug ''
    do
	echo "Building extension for $version in $type"

        $PHP_BIN_ROOT/$version$type/bin/phpize

	./configure --with-php-config=$PHP_BIN_ROOT/$version$type/bin/php-config

        make
        make test
        make install
        make clean

    done

done

