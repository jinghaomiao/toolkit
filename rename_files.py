#!/usr/bin/env python
import sys
import os

if len(sys.argv) < 4:
  print 'Usage: %s <root_dir_name> <rename_from> <rename_to> [levels]' % sys.argv[0]
  print 'e.g. ./rename.py ./ " " "_SPACE_"'
  exit()

root = sys.argv[1]
rename_from = sys.argv[2]
rename_to = sys.argv[3]
levels = 99999999
if len(sys.argv) == 5:
  levels = int(sys.argv[4])

def rename(dir_name, levels):
  if levels = 0:
    return

  for from_name in os.listdir(dir_name):
    full_name = os.path.join(dir_name, from_name)
    if os.path.isdir(full_name):
      rename(full_name, levels - 1)

    to_name = from_name.replace(rename_from, rename_to)
    if from_name != to_name:
      to_name = os.path.join(dir_name, to_name)
      os.rename(full_name, to_name)

rename(root, levels)

