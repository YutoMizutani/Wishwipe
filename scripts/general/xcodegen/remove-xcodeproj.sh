#!/bin/sh

# Check argv
if [ $# -ne 1 ]; then
  echo "remove-xcodeproj.sh: error: Use \`sh remove-xcodeproj.sh <PROJECT>.xcodeproj\`" 1>&2
  exit 1
fi

# Reove .xcodeproj
rm -rf $1 ; :
