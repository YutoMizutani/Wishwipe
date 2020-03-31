#!/bin/sh

source $(dirname $0)/source-carthage-cmd.sh

cd $(dirname $0)/../../..
$CARTHAGE_COMMAND update --platform iOS
