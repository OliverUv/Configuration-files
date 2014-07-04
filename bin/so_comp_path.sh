#!/usr/bin/env bash

EXARGS=1
E_BADARGS=65
if [ $# -ne $EXARGS ] ; then
    cat <<-EOF
    Usage: $(basename $0) [p]

    Where p is the path to the .so file you wish to inspect. Prints the
    source path for a .so file, assuming you have debug symbols for that
    library installed. GDB and other debuggers will automatically try to
    load the source from this path, so it is useful to know it if you
    want to map it to the path where it resides on your computer.

    This can be done with GDB's substitute-path command (see
    https://sourceware.org/gdb/onlinedocs/gdb/Source-Path.html), or in
    Qt Creator's Tools->Options->Debugger->General->Source Paths Mapping.
EOF

    exit $E_BADARGS
else
    XX=$(readelf -n "$1" | sed -nr 's/.*Build ID: (..).*/\1/p')
    YY=$(readelf -n "$1" | sed -nr 's/.*Build ID: [0-9][0-9]([0-9]*)/\1/p')
    readelf -wi "/usr/lib/debug/.build-id/$XX/$YY.debug" | grep DW_AT_comp_dir
    # | awk '{print $8}' if you want pretty output
fi
