#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
# Created: <+DATE+>

def parse_args():
  import argparse
  parser = argparse.ArgumentParser(description="""\
<+CURSOR+>
""")
  parser.add_argument("--version", action="version", version='%(prog)s 0.0.1')
  parser.add_argument("-o", "--output", metavar="output-file", default="output", help="output file")
  parser.add_argument("-l", "--little", action="store_true", help="little endian")
  parser.add_argument("file", metavar="input-file", help="input file")
  options = parser.parse_args()
  return options

def main(options):
  # Import
  import sys
  import os
  import numpy
  
  # Initial Read
  if(not os.path.isfile(options.file)):
    raise Exception("The input file does not exist.")
  global end
  end = ">"
  if(options.little): end = "<"


if(__name__ == '__main__'):
  options = parse_args
  main(options)
