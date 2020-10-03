#!/bin/bash

outf=doc.tex
outf_old=doc_old.tex

# save previous creation, if any
if [ -f $outf ]; then
	mv $outf $outf_old
fi

source general.sh

# tex function formatting
function fn_format_tex {
	sed "s/\(\(Function.*\) \([^( ]\+\) \?([^)]*)[^\\r]*\)/\\\subsection*{\3}\n\\\\texttt{\1}\n/g" $1
}

# add linebreaks, but not after headings
function add_breaks_tex {
	sed '/\\subsection\|^$/!s/\([^\r]*\)/\1~\\\\\n/g' $1
}

# escape some special characters
function escapes_tex {
        sed 's/_/\\_/g' $1 \
                | sed 's/#/\\#/g' \
                | sed 's/©/\\textcopyright{}/g'
}

# pipe documentation of all procedures into dokuwiki formatted file
echo "\\documentclass{article}" >> $outf
echo "\\usepackage[latin1]{inputenc}" >> $outf
echo "\\setlength\\parindent{0pt}" >> $outf
echo "\\begin{document}" >> $outf
for i in *.ipf
do
        echo "\\section*{$i}" \
                | escapes_tex \
                >> $outf
	cat "$i" \
		| fn_grep \
		| fn_reorder \
		| fn_format_tex \
		| comment_format \
                | rm_cr \
                | add_breaks_tex \
		| rm_front_spaces \
                | escapes_tex \
		>> $outf
done
echo "\\end{document}" >> $outf
