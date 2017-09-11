#!/usr/bin/env python3
"""Accumlate all numbers."""

import fileinput


def sum_of_input():
    """Sum all input data."""
    sum_of_line = lambda line: sum([int(part) for part in line.split()])
    return sum([sum_of_line(line) for line in fileinput.input()])

if __name__ == '__main__':
    print(sum_of_input())
