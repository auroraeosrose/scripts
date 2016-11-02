PHP building
=======

The scripts in this directory I use for working and testing on PHP
there are a bunch of branches still in active use (oh that 5.2 would just DIE already)
and multiple ways of building PHP, this sets up environments for me to run and test with

Some notes:

1. I generally use Ubuntu 12.04 as my "I'm writing C on linux" box so assumptions and defaults are made
2. You will need both autoconf2.13 (old autoconf) and flex-old (2.5.4) PLUS get an ancient bison to build 5.2 (those are ubuntu package names)
3. If you run build.sh it may take a LONG time with the tests running, I thought about making that configurable but eh, patches welcome
4. There are two checkouts because my active work happens in my own fork of php, but to commit to actual php you need the other one... annoying project workflow
5. This will blow up if you don't have permission to install PHP wherever it is you want to put it (/usr/local for example)
6. Read the comments, I try to make important stuff configurable via env variables to save hassle and make things as automated as possible
7. You'll need git, bison, re2c, and libraries to build PHP, this doesn't install software, just checks out code and builds using tools you should already have

After everything is built, you can build and test multiple versions of your extension with phpize.sh

set ONLY_5=1 if you want to test only php 5.6
set ONLY_7=1 if you want to test only php 7.0+

you can set EXT_SOURCE to the location of your source, or run the script from your source (it assumes . if not supplied)

You can also set your PHP_BIN_ROOT if you've put the php compiles somewhere else
