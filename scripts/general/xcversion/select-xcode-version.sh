#!/bin/sh

source $(dirname $0)/../ruby/source-gem-cmd.sh
source $(dirname $0)/../ruby/source-bundle-cmd.sh

# Install Gems
if !($GEM_CMD contents xcode-install > /dev/null 2>&1); then
  sh $(dirname $0)/../ruby/bundle-install.sh
fi

# Check argv
if [ $# -ne 1 ]; then
  echo "select-xcode-version.sh: error: Required the version" 1>&2
  exit 1
fi

# xcode-install says `Xcode VER.SION.NUM.BER`
XCVERSION_OUTPUT_PREFIX="Xcode "

EXPECT_XCODE_VERSION=$1
CURRENT_XCODE_VERSION=`xcversion selected | grep -i $XCVERSION_OUTPUT_PREFIX | tr -d $XCVERSION_OUTPUT_PREFIX`

# Select Xcode version if these are different
if test $EXPECT_XCODE_VERSION != $CURRENT_XCODE_VERSION; then
  $BUNDLE_CMD exec xcversion install $EXPECT_XCODE_VERSION ; :
  $BUNDLE_CMD exec xcversion select $EXPECT_XCODE_VERSION
fi
