#!/bin/sh

# updates and builds and runs lcov for new php versions

export CHECKOUT_PATH=/home/auroraeosrose/Documents/Code/github.com/php

/home/auroraeosrose/Documents/Code/github.com/auroraeosrose/scripts/php/update.sh

export PHP_BIN_ROOT=/usr/local/php

export PHP_SOURCE =/home/auroraeosrose/Documents/Code/github.com/php

/home/auroraeosrose/Documents/Code/github.com/auroraeosrose/scripts/php/build.sh
