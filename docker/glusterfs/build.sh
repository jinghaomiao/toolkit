#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE[0]}")"

# TODO(you): Download a source code package from
# https://github.com/gluster/glusterfs/releases and extract as glusterfs folder.


docker build -t local:glusterfs --network=host .
