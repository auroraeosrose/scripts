PHP building
=======

The scripts in this directory I use for working and testing on PHP
I'm now only working with PHP 7.1 plus - there have simply been
too many changes in the language to make earlier versions worth it

Some notes:

1. I generally use Ubuntu's Latest LTS as my "I'm writing C on linux" box so assumptions and defaults are made (currently 14.04)
2. If you run build.sh it may take a LONG time with the tests running, I thought about making that configurable but eh, patches welcome
3. This will blow up if you don't have permission to install PHP wherever it is you want to put it (/usr/local for example)
4. Read the comments, I try to make important stuff configurable via env variables to save hassle and make things as automated as possible
5. You'll need git, bison, re2c, and libraries to build PHP, this doesn't install software, just checks out code and builds using tools you should already have

After everything is built, you can build and test multiple versions of your extension with phpize.sh

you can set EXT_SOURCE to the location of your source, or run the script from your source (it assumes . if not supplied)

You can also set your PHP_BIN_ROOT if you've put the php compiles somewhere else

Only run worktree on new, update and then build is the usual workflow.

```bash
./worktree.sh
./update.sh
./build.sh
````