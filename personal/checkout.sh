#!/bin/sh

# This creates and checkouts out my personal layout
# I put all my code in ~/Documents/Code
# then I segregate it by the server, then by the project/organization

CHECKOUT_PATH=/home/auroraeosrose/Documents/Code

mkdir $CHECKOUT_PATH/github.com
mkdir $CHECKOUT_PATH/github.com/php
mkdir $CHECKOUT_PATH/github.com/auroraeosrose
mkdir $CHECKOUT_PATH/github.com/gtkforphp
mkdir $CHECKOUT_PATH/github.com/eosforphp

# Checkout my php fork, what I normally use to work
git clone git@github.com:auroraeosrose/php-src.git $CHECKOUT_PATH/github.com/php/php-src
cd $CHECKOUT_PATH/github.com/php/php-src
git fetch
git remote add upstream https://github.com/php/php-src.git
git fetch upstream

# checkout gtkforphp stuff
git clone git@github.com:gtkforphp/glib.git $CHECKOUT_PATH/github.com/gtkforphp/glib
git clone git@github.com:gtkforphp/gobject.git $CHECKOUT_PATH/github.com/gtkforphp/gobject
git clone git@github.com:gtkforphp/cairo.git $CHECKOUT_PATH/github.com/gtkforphp/cairo
git clone git@github.com:gtkforphp/pango.git $CHECKOUT_PATH/github.com/gtkforphp/pango
git clone git@github.com:gtkforphp/rsvg.git $CHECKOUT_PATH/github.com/gtkforphp/rsvg
git clone git@github.com:gtkforphp/gintrospection.git $CHECKOUT_PATH/github.com/gtkforphp/gintrospection
git clone git@github.com:gtkforphp/gtkforphp.github.io.git $CHECKOUT_PATH/github.com/gtkforphp/gtkforphp.github.io
git clone git@github.com:gtkforphp/generator.git $CHECKOUT_PATH/github.com/gtkforphp/generator

# checkout for eosforphp stuff
git clone git@github.com:eosforphp/structures.git $CHECKOUT_PATH/github.com/eosforphp/structures
git clone git@github.com:eosforphp/eosforphp.github.io.git $CHECKOUT_PATH/github.com/eosforphp/eosforphp.github.io

# run worktree.sh on my PHP checkout
export CHECKOUT_PATH=/home/auroraeosrose/Documents/Code/github.com/php

/home/auroraeosrose/Documents/Code/github.com/auroraeosrose/scripts/php/worktree.sh