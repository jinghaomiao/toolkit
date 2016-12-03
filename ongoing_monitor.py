#!/usr/bin/env python

import sys
import os

def scan_dir(BACK_UP_DIR):
  abs_files = [os.path.join(BACK_UP_DIR, f) for f in os.listdir(BACK_UP_DIR)]
  return sorted([f for f in abs_files if os.path.isfile(f)])

def new_diff(log_files):
  if len(log_files) == 0:
    print 'No log is found.'
  elif len(log_files) == 1:
    print file(log_files).read()
  else:
    os.system('diff {} {}'.format(log_files[-1], log_files[-2]))

def all_diff(log_files):
  if len(log_files) == 0:
    print 'No log is found.'
  elif len(log_files) == 1:
    print file(log_files).read()
  else:
    os.system('diff {} {}'.format(log_files[-1], log_files[0]))

def archive(log_files):
  cur = None
  for f in log_files:
    next_f = file(f).read()
    if cur != next_f:
      print "Keep", f
      cur = next_f
    else:  # delete f.
      print "Delete", f
      os.remove(f)

if __name__ == '__main__':
  if len(sys.argv) != 3:
    print 'Usage: {} <new_diff|all_diff|archive> <back_up_dir>'.format(sys.argv[0])
    sys.exit(0)

  ACTION = sys.argv[1]
  BACK_UP_DIR = sys.argv[2]

  log_files = scan_dir(BACK_UP_DIR)
  print '######## {} log files found'.format(len(log_files))
  if ACTION == 'new_diff':
    new_diff(log_files)
  elif ACTION == 'all_diff':
    all_diff(log_files)
  elif ACTION == 'archive':
        archive(log_files)