#!/bin/bash -

DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

if hash apt 2>/dev/null; then
  "$DIR/debian.sh" 1>&1 2>&1
fi