#!/bin/bash

source $(dirname $0)/../mint/source-mint-cmd.sh

# Install SwiftLint
if ! [[ `$MINT_CMD list | grep -s 'SwiftLint'` ]]; then
    sh $(dirname $0)/../mint/mint-install.sh
fi

SWIFTLINT_COMMAND="mint run SwiftLint swiftlint"
