#!/bin/sh

# Script to update a CANONICAL php set of repos
# so either github mirror or git.php.net
# see update-fork.sh for personal fork

# you can use env variables to set checkout_path new_workdir and git_url
# CHECKOUT_PATH variable is directory where we are putting the repos, defaults to ./
CHECKOUT_PATH=/home/auroraeosrose/Documents/Code/php.net

echo "Updating PHP Canonical source"

# You can fiddle with the list of available PHP's if you want
# This would be more elegant with bash 4 but alas ... there is centos (grumble)

for version in "master:master" "PHP-7.1:php-7.1" "PHP-7.0:php-7.0" "PHP-5.6:php-5.6"
do
    BRANCH=${version%%:*}
    DIRNAME=${version#*:}
    cd $CHECKOUT_PATH/$DIRNAME
    git reset --hard
    git pull origin $BRANCH
done

# you can use env variables to set checkout_path new_workdir and git_url
# CHECKOUT_PATH variable is directory where we are putting the repos, defaults to ./
CHECKOUT_PATH=/home/auroraeosrose/Documents/Code/github.com/php

echo "Updating PHP fork source"

# You can fiddle with the list of available PHP's if you want
# This would be more elegant with bash 4 but alas ... there is centos (grumble)

for version in "master:master" "PHP-7.1:php-7.1" "PHP-7.0:php-7.0" "PHP-5.6:php-5.6"
do
    BRANCH=${version%%:*}
    DIRNAME=${version#*:}
    cd $CHECKOUT_PATH/$DIRNAME

    git reset --hard
    git pull upstream $BRANCH
    git pull origin $BRANCH
    git push
done

git remote add upstream https://github.com/php/php-src.git
git fetch upstream
