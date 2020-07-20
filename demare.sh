#!/usr/bin/env bash

set -e
set -x

/init &

while ! curl localhost:8443
do
  sleep 2 # or less like 0.2
done

echo 'N ap ajoute ekstansyon sa yo!'
ls -l /root/extensions
cp -r /root/extensions /config/
rm -r /root/extensions

while true; do echo 'Hit CTRL+C to stop'; sleep 1; done