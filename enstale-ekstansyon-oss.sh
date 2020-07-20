#!/usr/bin/env bash

set -e
set -x

EKSTANSYON_YO=$(cat ekstansyon-oss.csv)

for EKSTANSYON in ${EKSTANSYON_YO}; do
  code-server --extensions-dir /config/extensions --install-extension ${EKSTANSYON}
done
