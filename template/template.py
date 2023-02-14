#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
# Created: <+DATE+>

# Import
import sys
import os
import numpy

def parse_args():
  import argparse
  parser = argparse.ArgumentParser(description="""\
<+CURSOR+>
""", formatter_class = argparse.ArgumentDefaultsHelpFormatter)
  parser.add_argument("--version", action="version", version='%(prog)s 0.0.1')
  parser.add_argument("-o", "--output", metavar="output-file", default="output", help="output file")
  parser.add_argument("-l", "--little", action="store_true", help="little endian")
  parser.add_argument("file", metavar="input-file", help="input file")
  options = parser.parse_args()
  
  # Initial Read
  if(not os.path.isfile(options.file)): 
    raise Exception("The input file does not exist.") 
  global end 
  end = ">"
  if(options.little):
    end = "<"

  return options

def main():
  # ArgumentParser
  options = parse_args()


if __name__ == '__main__':
  main()
