#!/usr/bin/env python

import sys

def help():
  print '''Example Usage:
    %s ./mark_as_y.txt=Y ./mark_as_n.txt=N
    The script will read the patterns in each file and mark every line from the
    STDIN as the given marker.
    A pattern is like: PART0 PART1 PART2 ...
    A line is matched only if it has all the parts in the same order.
    ''' % sys.argv[0]
  exit()

class Marker:
  def __init__(self, mark_patternsfile_map):
    for mark, patternsfile in mark_patternsfile_map.iteritems():
      self._mark_patterns[mark] = [line.split() for line in file(patternsfile)]

  def mark(self, line):
    for mark, patterns in self._mark_patterns.iteritems():
      for pattern in patterns:
        start_pos = 0
        for part in pattern:
          start_pos = line.find(part, start_pos)
          if start_pos == -1:  # Doesn't match.
            break
          start_pos += len(part)
        if start_pos > 0:  # Matches all.
          return mark

def main():
  if len(sys.argv) == 1:
    help()
  mark_patternsfile_map = {}
  for equation in sys.argv[1:]:
    patternsfile, mark = equation.split('=')
    mark_patternsfile_map[mark] = patternsfile
  marker = Marker(mark_patternsfile_map)
  for line in sys.stdin:
    print marker.mark(line), line

if __name__ == '__main__':
  main()

