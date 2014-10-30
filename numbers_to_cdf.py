#!/usr/bin/env python

import fileinput
import sys
import matplotlib.pyplot as plt

################################ HELP
def help():
  print 'Usage:', sys.argv[0], '[input_file]'
  print '''\
    Draw CDF graph for series of numbers.
    <input_file>    File that contains lines of numbers. Each line will become
                    a curve. STDIN will be used if not specified.'''
  exit()

if len(sys.argv) == 2 and (sys.argv[1] == '-h' or sys.argv[1] == '--help'):
  help()

################################ PROCESS
series_no = 1
for line in fileinput.input():
  numbers = [float(num) for num in line.split()]
  numbers.sort()
  numbers.insert(0, 0)
  count = [float(i)/len(numbers) for i in range(len(numbers))]
  series_label = 'Series %d, size = %d' % (series_no, len(numbers))
  series_no += 1
  plt.plot(numbers, count, label = series_label, loc = 'lower right')

plt.xlabel('Value')
plt.ylabel('Percentage')
plt.grid(True)
plt.legend()
plt.show()
