#!/bin/dash

# take in a program name
if test $# -eq 0; then
    echo "Usage: $0 <program>"
    exit
fi

# search path for the given program
found=0
for program in "$@"; do
    paths=$(echo "$PATH" | sed -E "s/:/ /g")
    for path in $paths; do 
        f="$path/$program"
        if test -x "$f"; then 
            ls "$f"
            found=1
        fi
    done
    if test $found -eq 0; then
        echo "$program not found"
    fi  
done

