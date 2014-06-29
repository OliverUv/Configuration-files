#!/usr/bin/env bash
EXARGS=1
E_BADARGS=65
if [ $# -ne $EXARGS ] ; then
    cat <<-EOF
    Usage: $(basename $0) [p]

    Where p is a file with playlist urls, one per line.
    Will download each playlist into a directory with the same name 
    as the playlist. A file called archive-log will keep track of
    downloaded videos, to avoid duplicates and allow scheduled,
    repeated, runs of this script.
EOF

    exit $E_BADARGS
else
    TMPFILE=$(mktemp)
    while read p; do
        # Download videos, log to tmp file
        youtube-dl --download-archive "archive-log" --ignore-errors -f best -o '%(playlist)s/%(playlist_index)s-%(title)s-%(id)s.%(ext)s' "$p" 2>&1 | tee -a $TMPFILE
    done < "$1"
    echo ""
    echo ""
    echo "Summary:"
    echo ""
    # Reformat playlist declaration lines
    sed --in-place -r 's/.*playlist\] playlist (.+): Collected ([0-9]+).*/ --- processed: \1 (\2 videos) ---/' $TMPFILE
    # Print all interesting lines
    grep -v '^\[' $TMPFILE | uniq -u
    rm -f $TMPFILE
fi
