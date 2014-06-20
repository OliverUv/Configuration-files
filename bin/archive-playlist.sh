#!/usr/bin/env sh
EXARGS=2
E_BADARGS=65
if [ $# -ne $EXARGS ] ; then
 echo "Usage: $(basename $0) archive-file playlist-url"
 exit $E_BADARGS
else
    youtube-dl --download-archive "$1" --ignore-errors -f best -o '%(playlist)s/%(playlist_index)s-%(title)s-%(id)s.%(ext)s' "$2"
fi
