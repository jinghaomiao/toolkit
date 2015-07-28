#!/usr/bin/env python

import fileinput
import sys
import matplotlib.pyplot as plt

################################ HELP
def help():
  print 'Usage:', sys.argv[0], '[input_file]'
  print '''\
    Draw pie chart with data like:
    count0 name0
    count1 name1
    ...
    <input_file>    File that contains lines of numbers. STDIN will be used if
                    not specified.'''
  exit()

if len(sys.argv) == 2 and (sys.argv[1] == '-h' or sys.argv[1] == '--help'):
  help()

################################ PROCESS
fracs = []
labels = []
count = 0
for line in fileinput.input():
  arr = line.split(' ', 2)
  fracs.append(int(arr[0]))
  if len(arr) == 2:
    labels.append(arr[1])
  else:
    labels.append("No. %d" % count)
  count += 1
plt.pie(fracs, labels = labels)
plt.show()
