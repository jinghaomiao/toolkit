#!/usr/bin/env python

import sys
import matplotlib.pyplot as plt

numbers = []
for line in sys.stdin:
  for num in line.split():
    numbers.append(float(num))
n = int(sys.argv[1])

plt.xlabel('X Label')
plt.ylabel('Y Label')
plt.hist(numbers, n)
plt.show()
