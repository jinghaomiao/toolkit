#!/usr/bin/python
import sys
import os.path

################################ HELP
def help():
  print '''Usage: %s <file> <new_line>
    Append the new_line to the file, if it's new to the file.''' % sys.argv[0]
  exit()

if len(sys.argv) != 3:
  help()

################################ PROCESS
to_file = sys.argv[1]
new_line = sys.argv[2]

existed = False
if os.path.isfile(to_file):
  for line in file(to_file):
    if new_line == line[:-1]:
      existed = True
      break

if not existed:
  writer = open(to_file, 'a')
  writer.write(new_line + '\n')
  writer.close()

