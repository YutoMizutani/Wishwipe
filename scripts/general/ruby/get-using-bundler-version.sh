#!/bin/sh

source $(dirname $0)/source-bundler-cmd.sh

BUNDLER_VERSION_CMD="$BUNDLE_CMD -v"
BUNDLER_VERSION_REGEX="[0-9]+\\.[0-9]+\\.[0-9]+$"
BUNDLER_VERSION=`$BUNDLER_VERSION_CMD | grep -o -E $BUNDLER_VERSION_REGEX`

echo $BUNDLER_VERSION
