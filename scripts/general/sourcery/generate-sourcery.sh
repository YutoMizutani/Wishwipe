#!/bin/bash

# $SOURCERY_COMMAND の取得
source $(dirname $0)/source-sourcery-cmd.sh

SOURCERY_OPTIONS=`[ $# -eq 0 ] && echo "--config $(dirname $0)" || $@`

$SOURCERY_CMD $SOURCERY_OPTIONS
