#!/usr/bin/python
import sys, csv

def scan_csv(in_csv, delimiter):
  in_csv = file(in_csv, 'r')
  for line in csv.reader(in_csv):
    print delimiter.join(line)
  in_csv.close()

def main():
  if len(sys.argv) != 3:
    print 'Usage: ' + sys.argv[0] + ' <input_csv> <delimiter>'
    print '    Output csv data with the specified delimiter'
    exit()
  scan_csv(sys.argv[1], sys.argv[2])

if __name__ == '__main__':
  main()

