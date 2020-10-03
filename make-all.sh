#!/bin/bash

if [ ! -f *.ipf ]; then
	echo "Error in $(basename $0): No procedure file found."
	exit 1
fi

./make-dokuwiki.sh *.ipf
./make-tex.sh *.ipf

echo "All documentations have been generated."
