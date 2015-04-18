#!/usr/bin/env python
import fileinput

# Input a line, return its mark.
def mark(line):
  return ""

for line in fileinput.input():
  print mark(line), line

