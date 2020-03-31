#!/bin/sh

PROJECT_PATH=`[ $# -eq 0 ] && echo "$(dirname $0)/../../.." || echo $1`
# Translate to absolute path
PROJECT_PATH=`cd $PROJECT_PATH && pwd`
