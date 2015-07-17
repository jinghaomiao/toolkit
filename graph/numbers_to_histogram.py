#!/usr/bin/env python

import sys
import matplotlib.pyplot as plt

numbers = []
for line in sys.stdin:
  for num in line.split():
    numbers.append(int(num))
n = int(sys.argv[1])

plt.hist(numbers, n)
plt.show()
