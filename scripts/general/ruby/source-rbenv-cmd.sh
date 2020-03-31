#!/bin/sh

RBENV_CMD=rbenv

if !(type $RBENV_CMD > /dev/null 2>&1); then
  sh $(dirname $0)/../homebrew/homebrew-install.sh $RBENV_CMD
  cat << 'EOT' >> ~/.zshrc
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
  EOT
  exec $SHELL -l
fi
