#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: `basename $0` FILE"
    echo "Remove every whitespace from the end of each line and remove every blank line from the end of the file."
    echo "This utility is only supposed to work on plain text files having Unix newlines; binary files are ignored."
    echo "wspurify 0.3 is released under the GPLv3, hosted at https://github.com/mondalaci/wspurify"
    exit 1
fi

is_binary_file=`file -i "$1" | grep -v text/`
if [ -n "$is_binary_file" ]; then
    echo "$1 won't be wspurified because it's a binary file"
    exit 2
fi

tempfile=`tempfile`
cat "$1" | sed -e "s/[ \t]*$//" | sed -e :a -e '/^\n*$/{$d;N;ba' -e '}' > $tempfile
echo >> $tempfile  # Add closing newline.
mv $tempfile "$1"

