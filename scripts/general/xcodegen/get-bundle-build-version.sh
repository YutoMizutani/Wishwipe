#!/bin/sh

# Get bundle build version
VERSION_KEY="BUNDLE_BUILD_VERSION: " \
    && cat $(dirname $0)/../../../project.yml \
    | grep -i $VERSION_KEY \
    | sed -e "s/ *$VERSION_KEY//g"
