# CONTRIBUTING

In principle anyone can contribute to this.
Here are some features that would be nice to have:

*  Generate documentations in other formats, e.g. html, pdf
*  Allow for procedure files in a different style
*  Possibility to call directly from within Igor Pro
*  Allow user to supplement the automatic documentation with additional text

Currently, regular expressions are used for parsing the procedure files, even though the Igor language technically is not a [regular language](https://en.wikipedia.org/wiki/Regular_language). The parsing still works in most cases, especially if one sticks to the file layout that is outlined in [README.md](README.md) under "Usage". However, when you contribute, you're free to use any other kind of parsing.