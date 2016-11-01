#!/bin/sh

# This creates workdirs for multiple versions of PHP
# and if necessary sets up remotes

# The following script will checkout php from the git repo of your choosing

# you can use env variables to set checkout_path new_workdir and git_url
# CHECKOUT_PATH variable is directory where we are putting the repos, defaults to ./
CHECKOUT_PATH=/home/auroraeosrose/Documents/Code/github.com/php

# NEW_WORKDIR variable is location of new workdir script from git install, default is for ubuntu
NEW_WORKDIR=/usr/share/doc/git/contrib/workdir/git-new-workdir

echo "Creating new workdirs"

#  The following will be created as a new workdir linked to php-master
#  if you move or rename php-master - well just don't

# You can fiddle with the list of available PHP's if you want
# This would be more elegant with bash 4 but alas ... there is centos (grumble)

for version in "master:master" "PHP-7.1:php-7.1" "PHP-7.0:php-7.0" "PHP-5.6:php-5.6"
do
    BRANCH=${version%%:*}
    DIRNAME=${version#*:}
    echo "Creating workdir in $DIRNAME for $BRANCH"
    bash $NEW_WORKDIR $CHECKOUT_PATH/php-src $CHECKOUT_PATH/$DIRNAME $BRANCH
done

# you can use env variables to set checkout_path new_workdir and git_url
# CHECKOUT_PATH variable is directory where we are putting the repos, defaults to ./
CHECKOUT_PATH=/home/auroraeosrose/Documents/Code/php.net

for version in "master:master" "PHP-7.1:php-7.1" "PHP-7.0:php-7.0" "PHP-5.6:php-5.6"
do
    BRANCH=${version%%:*}
    DIRNAME=${version#*:}
    echo "Creating workdir in $DIRNAME for $BRANCH"
    bash $NEW_WORKDIR $CHECKOUT_PATH/php-src $CHECKOUT_PATH/$DIRNAME $BRANCH
done
