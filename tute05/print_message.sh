#! /usr/bin/env dash

print_message() {
    if test $# -eq 1; then
        echo "$0: warning $1"
    elif test $# -eq 2; then
        echo "$0: error: $2"
        exit $1
    fi
}

print_message "warning"
echo $@
print_message 20 "error"

