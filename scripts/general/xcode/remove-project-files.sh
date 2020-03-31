#!/bin/sh

source $(dirname $0)/source-project-extension.sh
source $(dirname $0)/source-workspace-extension.sh
source $(dirname $0)/source-project-path.sh $@

sh $(dirname $0)/get-project-name.sh $@ \
  | xargs -L 1 -I {} \
    sh -c 'mv $PROJECT_PATH/{}$PROJECT_EXTENSION $PROJECT_PATH/{}a$PROJECT_EXTENSION 2>/dev/null ; mv $PROJECT_PATH/{}$WORKSPACE_EXTENSION $PROJECT_PATH/{}a$WORKSPACE_EXTENSION 2>/dev/null'
