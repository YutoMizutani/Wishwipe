#!/bin/sh

source $(dirname $0)/source-project-extension.sh
source $(dirname $0)/source-project-path.sh $@

find $PROJECT_PATH -maxdepth 1 -mindepth 1 -iname "*$PROJECT_EXTENSION" | xargs -L 1 -I {} basename "{}" $PROJECT_EXTENSION
