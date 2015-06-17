#!/usr/bin/env python

import fileinput
import sys
import matplotlib.pyplot as plt

################################ HELP
def help():
  print 'Usage:', sys.argv[0], '[input_file]'
  print '''\
    Draw dot plot for series of 2D coordinates like:
    x00 y00 x01 y01 ...
    x10 y10 x11 y11 ...
    Dots in the same line will be in the same color.

    <input_file>    File that contains lines of numbers. STDIN will be used if
                    not specified.'''
  exit()

if len(sys.argv) == 2 and (sys.argv[1] == '-h' or sys.argv[1] == '--help'):
  help()

################################ PROCESS
series_no = 0
for line in fileinput.input():
  dots = line.split()
  dots_num = len(dots) / 2
  x = [dots[2 * i] for i in range(dots_num)]
  y = [dots[2 * i + 1] for i in range(dots_num)]

  series_label = 'Series %d, size = %d' % (series_no, dots_num)
  plt.plot(x, y, 'o', label = series_label)
  series_no += 1

plt.xlabel('X Label')
plt.ylabel('Y Label')
plt.grid(True)
plt.legend()

plt.show()
