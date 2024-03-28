#! /usr/bin/env python3

import sys
from argparse import ArgumentParser

# if len(sys.argv) == 1:
#     sys.argv.append("-")

parser = ArgumentParser()
parser.add_argument("-n", "--number", action="store_true", help="add line numbers to output")
parser.add_argument("-v", "--verbose", action="store_true", help="show control characters in output")
parser.add_argument("files", nargs="*", default="-", help="add line numbers to output")

args = parser.parse_args()

i = 1
for filename in args.files:
    try:
        if filename == "-":
            stream = sys.stdin
        else:
            stream = open(filename)

        for line in stream:

            if args.verbose:
                trans = str.maketrans({ i: "^" + chr(i + ord('A') - 1) for i in range(32) if i != 10 })
                line = line.translate(trans).replace('\n', '$\n')

            if args.number:
                sys.stdout.write(f"{i}  {line}")
            else:
                sys.stdout.write(line)

            i += 1

        if stream != sys.stdin:
            stream.close()

    except IOError as e:
        print(f"{sys.argv[0]}: can not open: {e.filename}: {e.strerror}")