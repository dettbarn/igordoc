#!/bin/bash

outf=doc.md
outf_old=doc_old.md

# save previous creation, if any
if [ -f $outf ]; then
	mv $outf $outf_old
fi

source general.sh

# markdown function formatting
function fn_format_markdown {
	sed "s/\(\(Function.*\) \([^( ]\+\) \?([^)]*).*$\)/### \3\n\n     \1\n/g" $1
}

# add linebreaks, but not after headings or code
function add_breaks_markdown {
	sed '/### \|^$\|^    /!s/\([^\r]*\)/\1  \n   \n<br>\n/g' $1
}

# pipe documentation of all procedures into markdown file
for i in *.ipf
do
	echo "## $i" >> $outf
	cat "$i" \
		| fn_grep \
		| fn_reorder \
		| fn_format_markdown \
		| comment_format \
		| add_breaks_markdown \
		| rm_front_spaces \
		>> $outf
done
