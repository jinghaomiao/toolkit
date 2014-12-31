#!/usr/bin/env python

import fileinput

sum = 0
for line in fileinput.input():
  for part in line.split():
    sum += int(part)
print sum,
