#!/usr/bin/python
import sys
import fileinput

################################ HELP
def help():
  print 'Usage:', sys.argv[0], '[input_file]'
  print '''\
    Works like `sort $input_file | uniq`, but pre-appends occurrence count on each line,
    and outputs in decrease order
    <input_file>    File that contains data. STDIN will be used if not specified.'''
  exit()

if len(sys.argv) == 2 and (sys.argv[1] == '-h' or sys.argv[1] == '--help'):
  help()

################################ PROCESS
count = {}
for line in fileinput.input():
  if count.has_key(line):
    count[line] += 1
  else:
    count[line] = 1

reversed_count = [(line, count[line]) for line in count]
reversed_count.sort(key = lambda x : x[1], reverse = True)

for line, cnt in reversed_count:
  print cnt, line,
