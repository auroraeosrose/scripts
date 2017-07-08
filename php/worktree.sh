#!/bin/sh

# This creates used to use the workdirs script
# but we now magically don't have that issue - hurray

# The following script will set up worktrees for both my php.net checkouts for current php versions
echo "Setting up worktrees"

[ -z $CHECKOUT_PATH ] && CHECKOUT_PATH=./

cd $CHECKOUT_PATH/php-src

for version in "PHP-7.1:php-7.1"
do
    BRANCH=${version%%:*}
    DIRNAME=${version#*:}
    git checkout -b $BRANCH origin/$BRANCH
    git worktree add $CHECKOUT_PATH/$DIRNAME $BRANCH
done

git checkout master
git worktree list