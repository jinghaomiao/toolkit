#!/usr/bin/env python

import fileinput
import sys
import matplotlib.pyplot as plt

################################ HELP
def help():
  print 'Usage:', sys.argv[0], '[input_file]'
  print '''\
    Draw curve graph for series of numbers in "x y x y ..." format.
    <input_file>    File that contains lines of numbers. Each line will become
                    a curve. STDIN will be used if not specified.'''
  exit()

if len(sys.argv) == 2 and (sys.argv[1] == '-h' or sys.argv[1] == '--help'):
  help()

################################ PROCESS
series_no = 1
for line in fileinput.input():
  numbers = [float(num) for num in line.split()]
  x = [numbers[i] for i in range(0, len(numbers), 2)]
  y = [numbers[i] for i in range(1, len(numbers), 2)]
  series_label = 'Series %d, size = %d' % (series_no, len(numbers))
  series_no += 1
  plt.plot(x, y, label = series_label)

plt.xlabel('Value')
plt.ylabel('Percentage')
plt.grid(True)
plt.legend(loc = 'lower right')
plt.show()

