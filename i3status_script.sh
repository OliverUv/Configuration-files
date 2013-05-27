#!/bin/sh

# prepend i3status with more stuff
i3status --config ~/.i3/status.conf | while :
do
        read line
        LG=$(setxkbmap -print | grep xkb_symbols | awk -F"+" '{print $2}') 
        LG=$(echo $LG | sed 's/latin/en/')
        echo "$LG  |  $line" || exit 1
done


        # read line
        # LG=$(setxkbmap -print | grep xkb_symbols | awk -F"+" '{print $2}') 
        # LG=$(echo $LG | sed 's/latin/en/')
        # OUT=$(echo "$LG | $line")
        # OUT=$(echo $OUT | sed 's/|/./g')
        # echo $OUT || exit 1
