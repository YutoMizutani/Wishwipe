#!/bin/sh

source $(dirname $0)/source-mint-cmd.sh
source $(dirname $0)/source-mintfile-path.sh
# Configure Mint PATHs
sh $(dirname $0)/configure-path.sh

# Install packages
$MINT_CMD bootstrap -m $MINTFILE_PATH
