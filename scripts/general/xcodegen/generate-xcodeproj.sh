#!/bin/sh

source $(dirname $0)/source-xcodegen-cmd.sh

# Generate .xcodeproj
$XCODEGEN_CMD generate --use-cache
