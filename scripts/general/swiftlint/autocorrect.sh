#!/bin/bash

source $(dirname $0)/get-command.sh

cd $(dirname $0)/../../..
$SWIFTLINT_COMMAND autocorrect --format
