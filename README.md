# igordoc

Scripts to generate documentations from [Igor Pro](https://www.wavemetrics.com/) user procedures (\*.ipf files) easily.

So far [DokuWiki](https://en.wikipedia.org/wiki/DokuWiki), [TeX](https://en.wikipedia.org/wiki/TeX), plain HTML and Markdown are supported target formats.

Take a look at [CONTRIBUTING.md](CONTRIBUTING.md) if you want to contribute.

## Requirements

Some bash-like shell is required, with these nontrivial utilities:

* pcregrep
* perl

## Usage

Your procedure files need to have a certain layout, similar to the example shown below. Most importantly, you should prepend all function headers with a comment block, i.e. several lines starting with two slashes (//). These comment blocks will be used for the documentations.

    ...
    ...
    //=================================================================
    // comment lines on top
    // should be styled like this
    // and you need those ===== separators in between
    Function myfunction(foo, bar)
        Variable foo
        Variable bar
    
        // function body
        // do stuff...
        // do other stuff...
    End
    //=================================================================
    // next function...
    Function myfunction2(baz)
    ...
    ...

To generate documentations out of all the \*.ipf files present, just call the desired make-\*.sh scripts inside your shell.

    $ ./make-dokuwiki.sh
    $ ./make-tex.sh
    $ ./make-html.sh
    $ ./make-markdown.sh

make-all.sh is a wrapper script that calls all other scripts.

    $ ./make-all.sh
