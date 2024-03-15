#! /usr/bin/env dash
# given archive files, use the correct program to extract the files

case $# in 
    0)
    echo "Usage: $0 <file> [<file> ...]"
    exit 
    ;;
esac

for file in "$@"; do
    if ! test -f "$file"; then
        echo "$0: error: '$file' is not a file" >&2
        exit 1
    fi

    case "$file" in 
        *.tar) tar xf "$file";;
        *.zip) unzip "$file" ;;
        *) 
            echo "$0: error: '$file' cannot be extracted" >&2
            exit 1
        ;;
    esac
done