#!/usr/bin/env python

import fileinput
import CoreGraphics

def CountPages(pdf_path):
  "Return the number of pages for the PDF document at the given path."  
  pdf = CoreGraphics.CGPDFDocumentCreateWithProvider(  
      CoreGraphics.CGDataProviderCreateWithFilename(pdf_path))
  if not pdf:
    return 'Unknown'
  return pdf.getNumberOfPages()

for line in fileinput.input():
  pdf_file = line[:-1]
  print pdf_file, CountPages(pdf_file)

