#!/bin/bash

source $(dirname $0)/../mint/source-mint-cmd.sh

# Install Carthage
if ! [[ `$MINT_CMD list | grep -s 'Carthage'` ]]; then
    sh $(dirname $0)/../mint/mint-install.sh
fi

CARTHAGE_COMMAND="mint run Carthage carthage"
