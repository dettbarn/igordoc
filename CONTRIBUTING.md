# CONTRIBUTING

In principle anyone can contribute to igordoc.
Here are some features that would be nice to have:

*  related to execution and/or the input:
    *  Port to Windows and macOS if possible (currently a pre-installed bash shell and some utilities are required to run igordoc)
    *  Possibility to call directly from within Igor Pro
    *  Allow for procedure files in a different style
*  related to the output:
    *  Generate documentations in other formats, e.g. pdf, ps, epub, djvu
    *  Add possibility to call pdflatex (and others) automatically on the LaTeX output
    *  Allow user to supplement the documentation with additional text
    *  Add possibility to customize the layout of outputs
*  technical tasks:
    *  Improve the readability of the regexes
    *  Separate the matching and replacements of the regexes, to eliminate their redundancies among different scripts

If you fully implement one of the points above, please make sure in your pull request you also remove it from the list. However, for the future, it would be better to work with the Issues tab instead.

Currently, regexes are used for parsing the procedure files, even though the Igor language technically is not a [regular language](https://en.wikipedia.org/wiki/Regular_language). The parsing still works in most cases, especially if one sticks to the file layout that is outlined in [README.md](README.md) under "Usage". However, when you contribute, you're free to use any other kind of parsing.


