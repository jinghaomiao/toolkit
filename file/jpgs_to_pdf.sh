#!/usr/bin/env bash

DIR=$1

RESOLUTION_DPI=300

echo "Check tools..."
TOOLS=(pdftoppm convert)
for tool in ${TOOLS[@]}; do
  if ! [ -x "$(command -v ${tool})" ]; then
    echo "Cannot find tool ${tool}, please install."
    exit 1
  fi
done

cd ${DIR}
convert *.jpg all.pdf

echo "Compress and combine..."
mkdir compressed
pdftoppm -r ${RESOLUTION_DPI} -jpeg all.pdf "compressed/dpi${RESOLUTION_DPI}"

cd compressed
convert *.jpg all.pdf

ls -al
