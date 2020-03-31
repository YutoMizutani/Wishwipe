#!/bin/sh

source $(dirname $0)/source-mint-cmd.sh
source $(dirname $0)/source-mintfile-path.sh
# Configure Mint PATHs
sh $(dirname $0)/configure-path.sh

# Update packages
# No update commands by Mint (No `.lock` files 😢@0.13.0)
$MINT_CMD install -m $MINTFILE_PATH
