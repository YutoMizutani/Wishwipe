#!/bin/sh

source $(dirname $0)/source-bundle-cmd.sh

# Install Bundler
if !($BUNDLE_CMD -v > /dev/null 2>&1); then
  sh $(dirname $0)/install-bundler.sh
fi

GEMFILE_PATH="$(dirname $0)/../../.."
NUMBER_OF_CPU=`expr $(sysctl -n hw.ncpu) - 1`
CONFIG_KEY_JOBS_COUNT="BUNDLE_JOBS"

# Install Gems
$BUNDLE_CMD install --gemfile=$GEMFILE_PATH/Gemfile -j $NUMBER_OF_CPU
# Remove concurrent configs after install
sed -i '' "/$CONFIG_KEY_JOBS_COUNT/d" $GEMFILE_PATH/.bundle/config
