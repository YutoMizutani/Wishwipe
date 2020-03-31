#!/bin/sh

XCODE_CMD=`xcode-select --print-path | awk 'match($0, /^.*.app/){ print substr($0, RSTART, RLENGTH) }'`
