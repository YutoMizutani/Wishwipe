#!/bin/bash

source $(dirname $0)/../mint/source-mint-cmd.sh

# Install Sourcery
if ! [[ `$MINT_CMD list | grep -s 'Sourcery'` ]]; then
    sh $(dirname $0)/../mint/mint-install.sh
fi

SOURCERY_CMD="mint run Sourcery sourcery"
