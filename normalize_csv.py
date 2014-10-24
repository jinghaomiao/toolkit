#!/usr/bin/python
import sys, csv

def scan_csv(in_csv, out_csv, field_count):
  in_csv = file(in_csv, 'r')
  out_csv = file(out_csv, 'w')
  writer = csv.writer(out_csv)
  for line in csv.reader(in_csv):
    if len(line) < field_count:
      print "Strange record:", line
      continue
    writer.writerow(line[:field_count])
  in_csv.close()
  out_csv.close()

def main():
  if len(sys.argv) != 4:
    print 'Usage: ' + sys.argv[0] + ' <input_csv> <output_csv> <n>'
    print '    Output a csv file containing exactly n fields'
    exit()
  scan_csv(sys.argv[1], sys.argv[2], int(sys.argv[3]))

if __name__ == '__main__':
  main()
