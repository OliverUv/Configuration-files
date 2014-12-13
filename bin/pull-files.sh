#!/usr/bin/env bash

# ./pull-files.sh list-of-files.txt extension-for-files 
# List of files has rows following this syntax URL<space>Filename
# the url must not contain spaces

COUNT=1
while read p; do
    # Download videos listed in a file, format url<space>name
    VID=$(echo "$p" | sed -nr 's/(\S+) .*/\1/p')
    NAME=$(echo "$p" | sed -nr 's/\S+ (.*)/\1/p')
    NAME=$(echo "$NAME" | sed -nr 's/ +/ /gp')
    printf -v ZPDCNT "%02d" $COUNT
    # echo "Getting $ZPDCNT - $NAME"
    wget "$VID" -O "$ZPDCNT - $NAME.$2"
    ((COUNT++)) # jesus christ
done < "$1"
