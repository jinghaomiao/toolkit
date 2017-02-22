#!/usr/bin/env python
import csv
import sys

def scan_csv(in_csv, delimiter):
  with open(in_csv, 'r') as f:
    for line in csv.reader(f):
      print delimiter.join(line)

def main():
  if len(sys.argv) != 3:
    print '''Usage: {} <input_csv> <delimiter>
        Output csv data with the specified delimiter'''.format(sys.argv[0])
    exit(1)
  scan_csv(sys.argv[1], sys.argv[2])

if __name__ == '__main__':
  main()
