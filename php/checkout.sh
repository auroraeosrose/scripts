#!/bin/sh

# Script to checkout and new workdir every active branch in PHP
# I'm currently supporting extensions on every active PHP branch
# Plus the evil of 5.2
# In order to do this I need builds of all versions of PHP

# The following script will checkout php from the git repo of your choosing

# you can use env variables to set checkout_path new_workdir and git_url
# CHECKOUT_PATH variable is directory where we are putting the repos, defaults to ./
[ -z $CHECKOUT_PATH ] && CHECKOUT_PATH=.

# NEW_WORKDIR variable is location of new workdir script from git install, default is for ubuntu
[ -z $NEW_WORKDIR ] && NEW_WORKDIR=/usr/share/doc/git/contrib/workdir/git-new-workdir

# GIT_URL variable is used to point to the php git you want to check out

# this is the public github mirror
# GIT_URL=https://github.com/php/php-src.git

# if you have a php.net account this will work
# but use the mirror/your own fork of the mirror if you don't
# GIT_URL=git@git.php.net:/php-src.git

# this is my personal fork
[ -z $GIT_URL ] && GIT_URL=git@github.com:auroraeosrose/php-src.git

echo "Checking out $GIT_URL to $CHECKOUT_PATH/php-master"

git clone $GIT_URL $CHECKOUT_PATH/php-master

echo "Creating new workdirs"

#  The following will be created as a new workdir linked to php-master
#  if you move or rename php-master - well just don't

# You can fiddle with the list of available PHP's if you want
# This would be more elegant with bash 4 but alas ... there is centos (grumble)

for version in "PHP-5.6:php-5.6" "PHP-5.5:php-5.5" "PHP-5.4:php-5.4" "PHP-5.3:php-5.3" "PHP-5.2:php-5.2"
do
    BRANCH=${version%%:*}
    DIRNAME=${version#*:}
    echo "Creating workdir in $DIRNAME for $BRANCH"
    bash $NEW_WORKDIR $CHECKOUT_PATH/php-master $CHECKOUT_PATH/$DIRNAME $BRANCH
done

