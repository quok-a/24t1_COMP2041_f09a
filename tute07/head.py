#! /usr/bin/env python3

import itertools
import sys

n = 10
if len(sys.argv) >= 1 and sys.argv[1].startswith('-'):
    n = int(sys.argv[1][1:])

stdin = 0
if len(sys.argv) == 1:
    stdin = 1

# i = 1
for file in sys.argv[1:]:
    try:
        print(f"== {file} ==")

        if stdin == 1:
            stream = sys.stdin
        else:
            stream = open(file)
        
        i = 1
        # for line in stream:
        #     if i > n: break

        #     sys.stdout.write(line)
        #     i += 1
        for line in itertools.islice(stream, n):
            sys.stdout.write(line)
            # print(line.strip())

        stream.close()

    except IOError as e:
        print(f"{sys.argv[0]}: cannot open: {e.filename}: {e.strerror}")