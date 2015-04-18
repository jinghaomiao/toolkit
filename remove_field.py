#!/usr/bin/env python
import sys

field_index = int(sys.argv[1])

for line in sys.stdin:
  arr = line.split()
  arr.pop(field_index)
  print ' '.join(arr)

