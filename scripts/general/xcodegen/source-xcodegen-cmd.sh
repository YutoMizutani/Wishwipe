#!/bin/bash

# Install Mint
if !(type mint > /dev/null 2>&1); then
    sh $(dirname $0)/../mint/install-mint.sh
fi

# Install SwiftLint
if ! [[ `mint list | grep -s 'xcodegen'` ]]; then
    sh $(dirname $0)/../mint/mint-install.sh
fi

XCODEGEN_CMD="mint run xcodegen xcodegen"
