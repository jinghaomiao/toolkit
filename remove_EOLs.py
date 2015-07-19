#!/usr/bin/python
import fileinput
import sys
################################ HELP
def help():
  print 'Usage:', sys.argv[0], '[input_file]'
  print '''\
    Remove extra whitespaces.
    <input_file>    File that contains data. STDIN will be used if not specified.'''
  exit()

if len(sys.argv) == 2 and (sys.argv[1] == '-h' or sys.argv[1] == '--help'):
  help()

################################ PROCESS
for line in fileinput.input():
  print line[:-1],

