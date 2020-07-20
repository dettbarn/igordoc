# igordoc

Scripts to generate documentations from [Igor Pro](https://www.wavemetrics.com/) user procedures (\*.ipf files) easily.

So far [DokuWiki](https://en.wikipedia.org/wiki/DokuWiki) is the only supported target format.

Take a look at [CONTRIBUTING.md](CONTRIBUTING.md) if you want to contribute.

## Requirements

Some bash-like shell is required, with these nontrivial utilities:

* pcregrep
* perl

## Usage

Your procedure files need to have a certain layout, which I will outline here in more detail soon. Most importantly, you should prepend all function headers with a comment block, i.e. several lines starting with two slashes (//). These comment blocks will be used for the documentations.

To generate documentations out of all the \*.ipf files present, just call the desired make-\*.sh scripts inside your shell.

    ./make-dokuwiki.sh

make-all.sh is a wrapper script that calls all other scripts.

    ./make-all.sh
