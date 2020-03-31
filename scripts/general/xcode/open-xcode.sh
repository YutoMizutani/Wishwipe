#!/bin/sh

source $(dirname $0)/source-project-path.sh $@
source $(dirname $0)/source-xcode-cmd.sh

# Open a Xcode project
echo "Open $PROJECT_PATH using $XCODE_CMD"
open -a $XCODE_CMD $PROJECT_PATH
