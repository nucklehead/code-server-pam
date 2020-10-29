#!/usr/bin/env bash

set -e
set -x

while IFS=, read -r EKSTANSYON_FULL VESYON
do
  IFS=.
  read -r PUBLISHER EKSTANSYON <<< ${EKSTANSYON_FULL}
  n=0
  wait_time=1
  until [ "$n" -ge 10 ]
  do
      curl "https://marketplace.visualstudio.com/_apis/public/gallery/publishers/${PUBLISHER}/vsextensions/${EKSTANSYON}/${VESYON}/vspackage" -o "${EKSTANSYON_FULL}.vsix.gz"
      gunzip "${EKSTANSYON_FULL}.vsix.gz" && break
      n=$((n+1))
      sleep ${wait_time}
      wait_time=$((wait_time*2))
  done

  code-server --extensions-dir /config/extensions --install-extension "${EKSTANSYON_FULL}.vsix"
  sleep 1
done < ekstansyon-ms.csv
