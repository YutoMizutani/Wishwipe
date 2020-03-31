#!/bin/sh

source $(dirname $0)/source-bundler-cmd.sh
source $(dirname $0)/source-gem-cmd.sh

# Install Bundler
if !($BUNDLER_CMD -v > /dev/null 2>&1); then
  BUNDLER_VERSION=`sh $(dirname $0)/get-bundler-version.sh`
  sudo $GEM_CMD install bundler -v $BUNDLER_VERSION
fi
