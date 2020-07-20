# igordoc

Codes to generate documentations from Igor Pro user procedures easily.

So far [DokuWiki](https://en.wikipedia.org/wiki/DokuWiki) is the only supported target format.

Take a look at [CONTRIBUTING.md](CONTRIBUTING.md) if you want to contribute.

## Requirements

Some bash-like shell is required, with these nontrivial utilities:

* pcregrep
* perl

## Usage

To generate documentations out of all the files present, just call the desired make-\*.sh scripts inside your shell.

    ./make-dokuwiki.sh

make-all.sh is a wrapper script that calls all others.

    ./make-all.sh
