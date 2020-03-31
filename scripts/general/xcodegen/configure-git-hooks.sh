#!/bin/sh

find $(dirname $0)/.githooks -type f | xargs -I v chmod a+x v
git config core.hooksPath $(dirname $0)/.githooks
