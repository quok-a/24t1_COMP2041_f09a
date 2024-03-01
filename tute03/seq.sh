#! /usr/bin/env dash

if test $# -eq 1; then
    first=1
    increment=1
    last=$1
elif test $# -eq 2; then
    first=$1
    increment=1
    last=$2
elif test $# -eq 3; then
    first=$1
    increment=$2
    last=$3
else
    # error checking
    echo "Usage: $0: [FIRST [INCREMENT]] LAST" >& 2
    exit 1
fi

if test "$first" -eq "$first" 2> /dev/null; then
    :
else
    echo "$0 Error: FIRST must be an integer" >& 2
    exit 1
fi
# check other vairables for integers
#
if test "$first" -ge "$last" 2> /dev/null; then
    echo "$0 error: FIRST must be less than LAST" >& 2
    exit 1
fi

if ["$increment" -le 0] 2> /dev/null; then
    echo "$0 error: INCREMENT must be positive" >& 2
    exit 1
fi

cur="$first"
while test "$cur" -le "$last"; do  
    echo "$cur"
    cur=$((cur + increment))
done
