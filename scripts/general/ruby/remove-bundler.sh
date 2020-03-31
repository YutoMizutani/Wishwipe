#!/bin/sh

source $(dirname $0)/source-bundler-cmd.sh
source $(dirname $0)/source-gem-cmd.sh

# Remove Bundler
if ($BUNDLER_CMD -v > /dev/null 2>&1); then
  sudo $GEM_CMD uninstall bundler
fi
