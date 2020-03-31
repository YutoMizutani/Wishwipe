#!/bin/sh

# Get bundle version
VERSION_KEY="BUNDLE_VERSION: " \
    && cat $(dirname $0)/../../../project.yml \
    | grep -i $VERSION_KEY \
    | sed -e "s/ *$VERSION_KEY//g"
