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
mkdir $CHECKOUT_PATH/gitlab.com
mkdir $CHECKOUT_PATH/php.net

# Checkout my php fork, what I normally use to work
git clone git@github.com:auroraeosrose/php-src.git $CHECKOUT_PATH/github.com/php/php-src
cd $CHECKOUT_PATH/github.com/php/php-src
git fetch
git remote add upstream https://github.com/php/php-src.git
git fetch upstream

# checkout my personal stuff - no windows stuff here though
git clone git@github.com:auroraeosrose/php-extensions-code.git $CHECKOUT_PATH/github.com/auroraeosrose/php-extensions-code
git clone git@github.com:auroraeosrose/fanpress.git $CHECKOUT_PATH/github.com/auroraeosrose/fanpress
git clone git@github.com:auroraeosrose/streams-exercises.git $CHECKOUT_PATH/github.com/auroraeosrose/streams-exercises
git clone git@github.com:auroraeosrose/event-and-signal-exercises.git $CHECKOUT_PATH/github.com/auroraeosrose/event-and-signal-exercises

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
git clone git@github.com:eosforphp/datastructures.git $CHECKOUT_PATH/github.com/eosforphp/datastructures
git clone git@github.com:eosforphp/eosforphp.github.io.git $CHECKOUT_PATH/github.com/eosforphp/eosforphp.github.io

# checkout php's git - only useful when I'm doing something in core
git clone git@git.php.net:/php-src.git $CHECKOUT_PATH/php.net/php-src
