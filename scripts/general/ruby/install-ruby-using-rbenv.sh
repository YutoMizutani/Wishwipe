#!/bin/sh

source $(dirname $0)/source-rbenv-cmd.sh
source $(dirname $0)/source-ruby-version.sh

# Install ruby
$RBENV_CMD install $RUBY_VERSION
$RBENV_CMD local $RUBY_VERSION
$RBENV_CMD rehash
