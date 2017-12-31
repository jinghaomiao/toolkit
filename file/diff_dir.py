#!/usr/bin/env python3
"""Diff two dirs."""
import os
import sys


# You may define different behavior according to your needs.
def list_dir(root, rel_path):
    """
    Return sub-files and sub-dirs.
        sub-files = {rel_path, size}
        sub-dirs = {rel_path}
    """
    path = os.path.join(root, rel_path)
    subfiles = dict()
    subdirs = set()
    for f in os.scandir(path):
        f_rel = os.path.join(rel_path, f.name)
        if f.is_file():
            subfiles[f_rel] = f.stat().st_size
        elif f.is_dir():
            subdirs.add(f_rel)
    return subfiles, subdirs

# Triggers.
def file_vs_dir(left, right, rel_path, left_size):
    print('{}\tfile_vs_dir\tsize: {}'.format(rel_path, left_size))

def file_vs_none(left, right, rel_path, left_size):
    print('{}\tfile_vs_none\tsize: {}'.format(rel_path, left_size))

def file_identical(left, right, rel_path, left_size):
    print('{}\tfile_identical\tsize: {}'.format(rel_path, left_size))

def file_vs_larger(left, right, rel_path, left_size, right_size):
    print('{}\tfile_vs_larger\tsize: {} {}'.format(rel_path, left_size, right_size))

def file_vs_smaller(left, right, rel_path, left_size, right_size):
    print('{}\tfile_vs_smaller\tsize: {} {}'.format(rel_path, left_size, right_size))

def dir_vs_file(left, right, rel_path, right_size):
    print('{}\tdir_vs_file\tsize: {}'.format(rel_path, right_size))

def none_vs_file(left, right, rel_path, right_size):
    print('{}\tnone_vs_file\tsize: {}'.format(rel_path, right_size))

def dir_vs_none(left, right, rel_path):
    print('{}\tdir_vs_none'.format(rel_path))

def none_vs_dir(left, right, rel_path):
    print('{}\tnone_vs_dir'.format(rel_path))


def diff_dir(left, right, rel_path):
    left_files, left_dirs = list_dir(left, rel_path)
    right_files, right_dirs = list_dir(right, rel_path)
    for rel_path in sorted(left_files.keys()):
        left_size = left_files[rel_path]
        if rel_path not in right_files:
            if rel_path in right_dirs:
                file_vs_dir(left, right, rel_path, left_size)
            else:
                file_vs_none(left, right, rel_path, left_size)
        else:
            right_size = right_files[rel_path]
            if left_size == right_size:
                
                file_identical(left, right, rel_path, left_size)
            elif left_size < right_size:
                file_vs_larger(left, right, rel_path, left_size, right_size)
            else:
                file_vs_smaller(left, right, rel_path, left_size, right_size)
    for rel_path in sorted(right_files.keys()):
        right_size = right_files[rel_path]
        if rel_path in left_files:
            continue
        if rel_path in left_dirs:
            dir_vs_file(left, right, rel_path, right_size)
        else:
            none_vs_file(left, right, rel_path, right_size)
    for rel_path in sorted(left_dirs):
        if rel_path in right_files:
            continue
        if rel_path in right_dirs:
            diff_dir(left, right, rel_path)
        else:
            dir_vs_none(left, right, rel_path)
    for rel_path in sorted(right_dirs):
        if rel_path in left_files:
            continue
        if rel_path in left_dirs:
            continue
        none_vs_dir(left, right, rel_path)

if __name__ == '__main__':
    diff_dir(sys.argv[1], sys.argv[2], '')
