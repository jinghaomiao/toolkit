#!/usr/bin/env python
import csv
import sys

field_index = int(sys.argv[1])
writer = csv.writer(sys.stdout)
for line in csv.reader(sys.stdin):
  del line[field_index]
  writer.writerow(line)

