#!/usr/bin/python
# -*- coding: utf-8 -*-
import sys
from HTMLParser import HTMLParser
reload(sys)
sys.setdefaultencoding('utf-8')

################################ HELP
def help():
  print 'Usage: ' + sys.argv[0] + ' <input_file>'
  print '    It works like `sort $input_file | uniq`, but pre-appends occurrence count on each line, and outputs in decrease order'
  exit()

if len(sys.argv) == 1:
  help()
elif sys.argv[1] == '-h' or sys.argv[1] == '--help':
  help()

################################ PROCESS
TARGET_TAG = sys.argv[1]

class Parser(HTMLParser):
  tag_depth = 0

  def handle_starttag(self, tag, attrs):
    # this is a tag to be removed
    if tag == TARGET_TAG:
      self.tag_depth += 1
    # it's not between the removing tags
    elif self.tag_depth == 0:
      attrs_str = ''
      for key,val in attrs:
        attrs_str += ' %s="%s"' % (key, val)
      print '<%s%s>' % (tag, attrs_str)

  def handle_endtag(self, tag):
    if tag == TARGET_TAG:
      self.tag_depth -= 1
    elif self.tag_depth == 0:
      print '</%s>' % tag

  def handle_data(self, data):
    if self.tag_depth == 0:
      print data

content = sys.stdin.read()
parser = Parser()
parser.feed(content)
