#!/usr/bin/env bash

DIR=$1

RESOLUTION_DPI=300
TIME=$(date +%Y%m%d_%H%M%S)

echo "Check tools..."
TOOLS=(pdftoppm convert)
for tool in ${TOOLS[@]}; do
  if ! [ -x "$(command -v ${tool})" ]; then
    echo "Cannot find tool ${tool}, please install."
    exit 1
  fi
done

echo "Convert all supported files to JPG..."
cd "${DIR}"
mkdir -p ${TIME}
for file in * ; do
  if [[ "$file" == *pdf ]] || [[ "$file" == *PDF ]] ; then
    pdftoppm -r ${RESOLUTION_DPI} -jpeg "$file" "${TIME}/$file"
  elif [[ "$file" == *jpg ]] || [[ "$file" == *JPG ]] || \
       [[ "$file" == *jpeg ]] || [[ "$file" == *JPEG ]] ; then
    cp "$file" "${TIME}/$file.jpg"
  elif [[ "$file" == *png ]] || [[ "$file" == *PNG ]] ; then
    convert "$file" "${TIME}/$file.jpg"
  fi
done

ls -al ${TIME}
