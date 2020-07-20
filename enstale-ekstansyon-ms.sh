#!/usr/bin/env bash

set -e
set -x

while IFS=, read -r EKSTANSYON_FULL VESYON
do
  IFS=.
  read -r PUBLISHER EKSTANSYON <<< ${EKSTANSYON_FULL}
  curl "https://marketplace.visualstudio.com/_apis/public/gallery/publishers/${PUBLISHER}/vsextensions/${EKSTANSYON}/${VESYON}/vspackage" -o "${EKSTANSYON_FULL}.vsix.gz"
  gunzip "${EKSTANSYON_FULL}.vsix.gz"
  code-server --extensions-dir /config/extensions --install-extension "${EKSTANSYON_FULL}.vsix"
done < ekstansyon-ms.csv
