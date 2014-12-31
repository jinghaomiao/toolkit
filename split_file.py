#!/usr/bin/env python
import sys
import math

################################ HELP
def help():
  print 'Usage: %s <output_prefix> [-l lines_per_file]|[-n files_count]|[-m max_lines_per_file]'
  print '''    Split the STDIN to sub-files.'''
  exit()

if len(sys.argv) == 2 and (sys.argv[1] == '-h' or sys.argv[1] == '--help'):
  help()
elif len(sys.argv) != 4:
  help()

################################ FUNCTIONS
def produce_files(lines, output_format, number_of_lines):
  output = None
  file_id = 0
  line_id = 0
  for line in lines:
    if line_id % number_of_lines == 0:
      if output:
        output.close()
      output_file = output_format % file_id
      output = open(output_file, 'w')
      file_id += 1
    output.write(line)
    line_id += 1
  output.close()

################################ PROCESS
output_prefix = sys.argv[1]
lines = [line for line in sys.stdin]
lines_count = len(lines)
if (sys.argv[2] == '-l'):
  number_of_lines = int(sys.argv[3])
  number_of_files = (lines_count + number_of_lines - 1) / number_of_lines
elif (sys.argv[2] == '-n'):
  number_of_files = int(sys.argv[3])
  number_of_lines = (lines_count + number_of_files - 1) / number_of_files
elif (sys.argv[2] == '-m'):
  max_lines_per_file = int(sys.argv[3])
  number_of_files = (lines_count + max_lines_per_file - 1) / max_lines_per_file
  number_of_lines = (lines_count + number_of_files - 1) / number_of_files

number_of_files_width = int(math.log10(number_of_files))+1
output_format = '%s_%%0%dd_of_%d' % (output_prefix, number_of_files_width, number_of_files)

produce_files(lines, output_format, number_of_lines)
