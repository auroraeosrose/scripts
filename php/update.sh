#!/bin/sh

# Script to update a CANONICAL php set of repos
# so either github mirror or git.php.net
# see update-fork.sh for personal fork

# For use with checkout.sh

# SOURCE_PATH variable is directory where we put the repos, defaults to ./
[ -z $SOURCE_PATH ] && SOURCE_PATH=.

echo "Updating PHP Canonical source"

# You can fiddle with the list of available PHP's if you want
# This would be more elegant with bash 4 but alas ... there is centos (grumble)

for version in "PHP-5.6:php-5.6" "PHP-5.5:php-5.5" "PHP-5.4:php-5.4" "PHP-5.3:php-5.3" "PHP-5.2:php-5.2"
do
    BRANCH=${version%%:*}
    DIRNAME=${version#*:}
    cd $SOURCE_PATH/$DIRNAME
    git reset --hard
    git pull origin $BRANCH
done