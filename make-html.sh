#!/bin/bash

outf=doc.html
outf_old=doc_old.html

# save previous creation, if any
if [ -f $outf ]; then
	mv $outf $outf_old
fi

source general.sh

# html function formatting
function fn_format_html {
	sed "s/\(\(Function.*\) \([^( ]\+\) \?([^)]*).*$\)/<h3>\3<\/h3><tt>\1<\/tt><br><br>/g" $1
}

# add linebreaks, but not after headings
function add_breaks_html {
	sed '/<h3\|^$/!s/\([^\r]*\)/\1<br>/g' $1
}

# pipe documentation of all procedures into html file
echo "<!DOCTYPE html>" >> $outf
echo "<html>" >> $outf
echo "<head>" >> $outf
echo "</head>" >> $outf
echo "<body>" >> $outf
for i in *.ipf
do
	echo "<h2>$i</h2>" >> $outf
	cat "$i" \
		| fn_grep \
		| fn_reorder \
		| fn_format_html \
		| comment_format \
		| add_breaks_html \
		| rm_front_spaces \
		>> $outf
done
echo "</body>" >> $outf
echo "</html>" >> $outf
