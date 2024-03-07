#!/bin/dash

# error checking, positive int only
if test $# -ne 1 || test ! "$1" -eq "$1" 2>/dev/null || test "$1" -le 0; then
    echo "Usage: $0 <positive-integer>"
    exit
fi

num=$1
i=2
# pwd
# loop through and if divisible
while test $i -lt $num; do
    if ./is_prime.sh "$i" > /dev/null; then
        echo "$i"
    fi
    i=$((i + 1))
done
