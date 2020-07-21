#!/bin/bash

outf=dokuwiki.txt
outf_old=dokuwiki_old.txt

# save previous creation, if any
if [ -f $outf ]; then
	mv $outf $outf_old
fi

# search for function headers, perhaps predeced by commented lines
function fn_grep {
	pcregrep -M '(//.*\r?\n)*Function' $1
}

# move function header before the comments
function fn_reorder {
	perl -0777 -i.original -pe 's/(\/\/(=====|-----).*\r?\n?)((\/\/.*\r?\n?)*)(Function.*\r?\n?)/\n\5\3\n/g' $1
}

# dokuwiki function formatting
function fn_format {
	sed "s/\(\(Function.*\) \([^( ]\+\) \?([^)]*).*$\)/==== \3 ====\n''\1''/g" $1
}

# remove double-slashes before comments
function comment_format {
	sed 's/\/\/\(.*\)/\1/g' $1
}

# add linebreaks, but not after headings
function add_breaks {
	sed 's/\(.*[^=-]$\)/\1\\\\/g' $1
}

# remove single spaces at beginning of lines
function rm_front_spaces {
	sed 's/^ \(.*\)/\1/g' $1
}

# pipe documentation of all procedures into dokuwiki formatted file
for i in *.ipf
do
	echo "====== $i ======" >> $outf
	cat "$i" \
		| fn_grep \
		| fn_reorder \
		| fn_format \
		| comment_format \
		| add_breaks \
		| rm_front_spaces \
		>> $outf
done
