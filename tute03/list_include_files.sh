#!/bin/sh

for file in *.c
do
    if ! test -e "$file"; then
        echo "$0 error: no .c files in the current directory" >&2
        exit 1
    fi

    echo "$file includes:" 
    grep -E '^#include' "$file" |
    sed 's/[">][^">]*$//' |
    sed 's/^.*["<]//'
done