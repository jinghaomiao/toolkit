#!/usr/bin/env bash
# Known issues:
# 1. convert-im6.q16: cache resources exhausted ...
#    Edit /etc/ImageMagick-6/policy.xml, increase resource limit, E.g.:
#  <policy domain="resource" name="memory" value="2GiB"/>
#  <policy domain="resource" name="map" value="2GiB"/>
#  <policy domain="resource" name="area" value="2GiB"/>
#  <policy domain="resource" name="disk" value="2GiB"/>
# 2. convert-im6.q16: not authorized `all.pdf' @ error/constitute.c/WriteImage/1037.
#    Edit /etc/ImageMagick-6/policy.xml, change
#  <policy domain="coder" rights="none" pattern="PDF" />
#    to
#  <policy domain="coder" rights="read|write" pattern="PDF" />

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
mkdir -p compressed
pdftoppm -r ${RESOLUTION_DPI} -jpeg all.pdf "compressed/dpi${RESOLUTION_DPI}"

cd compressed
convert *.jpg all.pdf

ls -al
