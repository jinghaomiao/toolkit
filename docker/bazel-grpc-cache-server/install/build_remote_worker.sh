#!/usr/bin/env bash

set -x

cd $(dirname $0)
# Build server binary according to
# https://github.com/bazelbuild/bazel/blob/master/src/main/java/com/google/devtools/build/lib/remote/README.md
wget https://github.com/bazelbuild/bazel/archive/master.zip
unzip master.zip

cd bazel-master
bazel build -c opt //src/tools/remote_worker
