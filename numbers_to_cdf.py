#!/usr/bin/env python

import fileinput
import sys
import matplotlib.pyplot as plt

################################ HELP
def help():
  print 'Usage:', sys.argv[0], '[input_file]'
  print '    Generate CDF graph for series of numbers.'
  print '    input_file    File that contains lines of numbers. Each line will become a curve. STDIN will be used if not specified.'
  exit()

if len(sys.argv) == 2 and (sys.argv[1] == '-h' or sys.argv[1] == '--help'):
  help()

################################ PROCESS
line_no = 1
for line in fileinput.input():
  numbers = [float(num) for num in line.split()]
  numbers.sort()
  numbers.insert(0, 0)
  count = [float(i)/len(numbers) for i in range(len(numbers))]
  line_label = 'Line %d, size = %d' % (line_no, len(numbers))
  line_no += 1
  plt.plot(numbers, count, label = line_label)

plt.xlabel('Value')
plt.ylabel('Percentage')
plt.grid(True)
plt.legend()
plt.show()
