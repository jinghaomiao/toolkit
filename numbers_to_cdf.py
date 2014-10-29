#!/usr/bin/env python

import sys
import matplotlib.pyplot as plt

for line in sys.stdin:
  numbers = []
  for num in line.split():
    numbers.append(float(num))
  numbers.sort()
  count = [i for i in range(1, len(numbers)+1)]
  plt.plot(numbers, count)

plt.show()
