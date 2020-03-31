#!/bin/sh

source $(dirname $0)/../ruby/source-gem-cmd.sh
source $(dirname $0)/../ruby/source-bundle-cmd.sh

# Install Gems
if !($GEM_CMD contents cocoapods > /dev/null 2>&1); then
  sh $(dirname $0)/../ruby/bundle-install.sh
fi

# Install Pods
$BUNDLE_CMD exec pod install
