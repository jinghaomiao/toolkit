#!/usr/bin/env python

import os, sys

if len(sys.argv) != 4:
  print "Invalid arguments."
  exit()

def binary_search(test_program, start_id, end_id):
  while end_id - start_id > 1:
    print "Processing range [%d, %d]..." % (start_id, end_id)
    mid_id = (start_id + end_id) / 2
    mid_test = os.system("%s %d" % (test_program, mid_id))
    if mid_test == 0:
      start_id = mid_id
    else:
      end_id = mid_id
  return end_id

test_program = sys.argv[1]
start_id = int(sys.argv[2])
end_id = int(sys.argv[3])
print "First failed id is %d" % binary_search(test_program, start_id, end_id)
