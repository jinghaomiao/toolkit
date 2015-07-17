#!/usr/bin/env python

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
BaseX = int(sys.argv[1])
BaseY = int(sys.argv[2])
numbers = []
for line in sys.stdin:
  numbers.extend([int(num) for num in line.split()])
count = len(numbers)
x = [numbers[i] for i in range(count) if i % 2 == 0]
y = [numbers[i] for i in range(count) if i % 2 == 1]
series_label = 'Count: %d' % y[-1]
plt.loglog(x, y, label = series_label, basex = BaseX, basey = BaseY)

plt.xlabel('Value')
plt.ylabel('Count')
plt.legend(loc = 'lower right')
plt.grid(True)
plt.show()
