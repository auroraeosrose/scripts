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

I generally only run worktree on a new box and checkouts

Running update and then build is the usual workflow

```bash
./worktree.sh
./update.sh
./build.sh
````