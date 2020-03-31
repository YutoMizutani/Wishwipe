#!/bin/sh

source $(dirname $0)/get-bundle-cmd.sh

# Install Bundler
if !($BUNDLE_CMD -v > /dev/null 2>&1); then
  sh $(dirname $0)/install-bundler.sh
fi

GEMFILE_PATH="$(dirname $0)/../../.."
NUMBER_OF_CPU=`expr $(sysctl -n hw.ncpu) - 1`
CONFIG_KEY_JOBS_COUNT="BUNDLE_JOBS"

# Reinstall Bundler if less than locked version
USING_BUNDLER_VERSION=`sh $(dirname $0)/get-using-bundler-version.sh`
LOCKED_BUNDLER_VERSION=`sh $(dirname $0)/get-bundler-version.sh`
if ! [ "$(printf '%s\n' "$LOCKED_BUNDLER_VERSION" "$USING_BUNDLER_VERSION" | sort -V | head -n1)" = "$LOCKED_BUNDLER_VERSION" ]; then
  sh $(dirname $0)/remove-bundler.sh
  sh $(dirname $0)/install-bundler.sh
fi

# Install Gems
$BUNDLE_CMD update --gemfile=$GEMFILE_PATH/Gemfile -j $NUMBER_OF_CPU
# Remove concurrent configs after install
sed -i '' "/$CONFIG_KEY_JOBS_COUNT/d" $GEMFILE_PATH/.bundle/config
