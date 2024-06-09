#!/usr/bin/env sh

if [ ! -f /etc/portage/package.accept_keywords/dev-util/shellcheck ]; then
  if [ ! -d /etc/portage/package.accept_keywords/dev-util ]; then
    sudo mkdir -p /etc/portage/package.accept_keywords/dev-util
  fi

  echo '=dev-util/shellcheck-0.9.0-r2 ~amd64' | sudo tee -a /etc/portage/package.accept_keywords/dev-util/shellcheck
fi

sudo emerge -n dev-util/shellcheck
