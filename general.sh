#!/bin/bash

# search for function headers, perhaps predeced by commented lines
function fn_grep {
	pcregrep -M '(//.*\r?\n)*Function' $1
}

# move function header before the comments
function fn_reorder {
	perl -0777 -pe 's/(\/\/(===|---).*\r?\n?)((\/\/.*\r?\n?)*)(Function.*\r?\n?)/\n\5\3\n/g' $1
}

# remove double-slashes before comments
function comment_format {
	sed 's/\/\/\(.*\)/\1/g' $1
}

# remove single spaces at beginning of lines
function rm_front_spaces {
	sed 's/^ \(.*\)/\1/g' $1
}

# remove carriage returns
function rm_cr {
        sed 's/\r//g'
}