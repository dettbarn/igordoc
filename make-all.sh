#!/bin/bash

if [ -z "$(find . -type f -name '*.ipf')" ]; then
	echo "Error in $(basename $0): No procedure file found."
	exit 1
fi

./make-dokuwiki.sh *.ipf
./make-tex.sh *.ipf
./make-html.sh *.ipf
./make-markdown.sh *.ipf

echo "All documentations have been generated."
