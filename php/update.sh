#!/bin/sh

CHECKOUT_PATH=/home/auroraeosrose/Documents/Code/github.com/php

echo "Updating PHP fork source"

# You can fiddle with the list of available PHP's if you want

for version in "master:php-src" "PHP-7.1:php-7.1"
do
    BRANCH=${version%%:*}
    DIRNAME=${version#*:}

    cd $CHECKOUT_PATH/$DIRNAME

    git reset --hard upstream/$BRANCH
    git pull origin $BRANCH
    git pull upstream $BRANCH
    git push
done
