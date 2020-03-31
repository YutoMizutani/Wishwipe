#!/bin/sh

cd $(dirname $0)/../../..

# Create directories
mkdir -p Mints/{lib,bin}

# Export and change Mint PATHs
export MINT_PATH=Mints/lib
export MINT_LINK_PATH=Mints/bin
