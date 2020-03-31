#!/bin/sh

MINT_CMD=mint

# Install Mint
if !(type $MINT_CMD > /dev/null 2>&1); then
  sh $(dirname $0)/../homebrew/homebrew-install.sh $MINT_CMD
fi
