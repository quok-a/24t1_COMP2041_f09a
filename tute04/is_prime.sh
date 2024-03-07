#! /bin/dash

# error checking, positive int only
if test $# -ne 1 || test ! "$1" -eq "$1" 2>/dev/null || test "$1" -le 0; then
    echo "Usage: $0 <positive-integer>"
    exit
fi

num=$1
# 1 is not prime
if test "$1" -eq 1; then
    echo "$1 is not prime"
    exit 1
fi

i=2
# loop through and if divisible
while test $i -lt $num; do
    if test $((num % i)) -eq 0; then
        echo "$num is not prime"
        exit 1
    fi
    i=$((i + 1))
done

echo "$num is prime"
echo 0