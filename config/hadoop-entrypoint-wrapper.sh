#!/bin/bash
set -xueo pipefail

# /entrypoint.sh uses `sed` to parse and update the .xml configuration files.
# bind mounting the files directly into the correct directory causes them to be read-only and
# causes /entrypoint.sh to fail.
# Instead, we mount it on /tmp and copy it before `exec`-ing into /entrypoint.sh
# :shrug:

cp -f /tmp/hadoop/*.xml /hadoop/etc/hadoop/
exec /entrypoint.sh
