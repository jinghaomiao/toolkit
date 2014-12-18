import sys
import os

# Usage:
# ./rename.py <root_dir_name> <rename_from> <rename_to>
# e.g. ./rename.py ./ " " "_SPACE_"

root = sys.argv[1]
rename_from = sys.argv[2]
rename_to = sys.argv[3]

def rename(dir_name):
  for from_name in os.listdir(dir_name):
    full_name = os.path.join(dir_name, from_name)
    if os.path.isdir(full_name):
      rename(full_name)

    to_name = from_name.replace(rename_from, rename_to)
    if from_name != to_name:
      to_name = os.path.join(dir_name, to_name)
      os.rename(full_name, to_name)

rename(root)

