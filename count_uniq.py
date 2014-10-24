#!/usr/bin/python
import sys

def scan(input_file):
  count = {}
  for line in file(input_file):
    line = line[:-1]
    if count.has_key(line):
      count[line] += 1
    else:
      count[line] = 1

  reversed_count = [(line, count[line]) for line in count]
  reversed_count.sort(key = lambda x : x[1], reverse = True)

  for line, cnt in reversed_count:
    print cnt, line

def main():
  if len(sys.argv) != 2:
    print 'Usage: ' + sys.argv[0] + ' <input_file>'
    print '    It works like `sort $input_file | uniq`, but pre-appends occurrence count on each line, and outputs in decrease order'
    exit()
  scan(sys.argv[1])

if __name__ == '__main__':
  main()
