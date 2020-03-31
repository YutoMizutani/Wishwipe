#!/bin/sh

HOMEBREW_CMD=brew

# Install Homebrew
if !(type $HOMEBREW_CMD > /dev/null 2>&1); then
  sh $(dirname $0)/install-homebrew.sh
fi
