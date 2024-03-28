#! /usr/bin/env python3

import re

def main():
    print("hello!")
    string_to_search = "hello world\nbye"
    search = re.search(r'', string_to_search, re.IGNORECASE)

if __name__ == '__main__':
    main()

# search: most similar to grep, matches anywhere
# match: equivalent to ^
# fullmatch: equivalent to using both ^ and $
