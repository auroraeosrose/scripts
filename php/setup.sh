#!/bin/sh

# My personal script to set up a new dev box

# checkout php.net
export CHECKOUT_PATH=/home/auroraeosrose/Code/php.net
export GIT_URL=git@git.php.net:/php-src.git

./checkout.sh

# checkout github fork
export CHECKOUT_PATH=/home/auroraeosrose/Code/github.com
export GIT_URL=git@github.com:auroraeosrose/php-src.git

./checkout.sh

# set my upstream for the github fork to the php mirror
cd $CHECKOUT_PATH/php-master
git remote add upstream https://github.com/php/php-src.git
git fetch upstream
cd -

# update php.net
export SOURCE_PATH=/home/auroraeosrose/Code/php.net
./update.sh

# update github fork
export SOURCE_PATH=/home/auroraeosrose/Code/github.com
./update-fork.sh

# uncomment these for clang instead of gcc
#export CC=clang
#export CXX=clang++

# build github fork
export PHP_SOURCE=/home/auroraeosrose/Code/github.com
./build.sh

