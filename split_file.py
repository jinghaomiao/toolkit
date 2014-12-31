#!/usr/bin/env python
import sys

################################ HELP
def help():
  print 'Usage: %s <output_prefix> [-l number_of_lines]|[-n number_of_files]'
  print '''\
    Split the STDIN to sub-files.
    <output_prefix>          Prefix of output sub-files.
    <-l number_of_lines>     Split by lines count.
    <-n number_of_files>     Split by maximum sub-files.
    <-m max_lines> Split by maximum lines per file.'''
  exit()

if len(sys.argv) == 2 and (sys.argv[1] == '-h' or sys.argv[1] == '--help'):
  help()
elif len(sys.argv) != 4:
  help()

################################ FUNCTIONS
def produce_files(lines, output_prefix, number_of_lines):
  output = None
  file_id = 0
  line_id = 0
  for line in lines:
    if line_id % number_of_lines == 0:
      if output:
        output.close()
      output_file = '%s_%d' % (output_prefix, file_id)
      output = open(output_file, 'w')
      file_id += 1
    output.write(line)
    line_id += 1
  output.close()

################################ PROCESS
output_prefix = sys.argv[1]
lines = None
number_of_lines = 0
if (sys.argv[2] == '-l'):
  number_of_lines = int(sys.argv[3])
  lines = sys.stdin
elif (sys.argv[2] == '-n'):
  number_of_files = int(sys.argv[3])
  lines = [line for line in sys.stdin]
  number_of_lines = (len(lines) + number_of_files - 1) / number_of_files
  output_prefix += '_%s' % sys.argv[3]
elif (sys.argv[2] == '-m'):
  max_lines_per_file = int(sys.argv[3])
  lines = [line for line in sys.stdin]
  lines_count = len(lines)
  number_of_files = (lines_count + max_lines_per_file - 1) / max_lines_per_file
  number_of_lines = (lines_count + number_of_files - 1) / number_of_files
  output_prefix += '_%d' % number_of_files

produce_files(lines, output_prefix, number_of_lines)
