#!/bin/bash

outf=dokuwiki.txt
outf_old=dokuwiki_old.txt

# save previous creation, if any
if [ -f $outf ]; then
	mv $outf $outf_old
fi

source general.sh

# dokuwiki function formatting
function fn_format_dokuwiki {
	sed "s/\(\(Function.*\) \([^( ]\+\) \?([^)]*).*$\)/==== \3 ====\n''\1''/g" $1
}

# add linebreaks, but not after headings
function add_breaks_dokuwiki {
	sed 's/\(.*[^=-]$\)/\1\\\\/g' $1
}

# pipe documentation of all procedures into dokuwiki formatted file
for i in *.ipf
do
	echo "====== $i ======" >> $outf
	cat "$i" \
		| fn_grep \
		| fn_reorder \
		| fn_format_dokuwiki \
		| comment_format \
		| add_breaks_dokuwiki \
		| rm_front_spaces \
		>> $outf
done
