#!/usr/bin/env python3
"""Count entries."""
import collections
import fileinput


def count_input():
    """Count entries in fileinput."""
    cnt_dict = collections.defaultdict(int)
    for line in fileinput.input():
        cnt_dict[line[:-1]] += 1
    return sorted(cnt_dict.items(), key=lambda x: x[1], reverse=True)

if __name__ == '__main__':
    for key, cnt in count_input():
        print('{}\t{}'.format(cnt, key))
