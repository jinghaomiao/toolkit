#!/usr/bin/env python

import fileinput
import sys
import matplotlib.pyplot as plt

################################ HELP
def help():
  print 'Usage:', sys.argv[0], '[input_file]'
  print '''\
    Draw dot plot for series of 2D coordinates like:
    x00 x01 x02 ...
    y00 y01 y02 ...
    x10 x11 x12 ...
    y10 y11 y12 ...
    (x00, y00), (x01, y01), ... will be in the same color, while (x10, y10),
    ... in another.

    <input_file>    File that contains lines of numbers. STDIN will be used if
                    not specified.'''
  exit()

if len(sys.argv) == 2 and (sys.argv[1] == '-h' or sys.argv[1] == '--help'):
  help()

################################ PROCESS
series_no = 0
x = None
y = None
for line in fileinput.input():
  if series_no % 2 == 0:
    x = [float(num) for num in line.split()]
  else:
    y = [float(num) for num in line.split()]
    series_label = 'Series %d, size = %d' % ((series_no / 2) + 1, len(x))
    plt.plot(x, y, 'o', label = series_label)
  series_no += 1

plt.grid(True)
plt.legend()
plt.show()
