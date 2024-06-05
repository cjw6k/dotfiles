#!/usr/bin/env sh

if [ ! -f /etc/portage/package.accepted_keyworks/dev-util/shellcheck ]; then
  if [ ! -d /etc/portage/package.accepted_keyworks/dev-util ]; then
    sudo mkdir -p /etc/portage/package.accepted_keyworks/dev-util
  fi

  echo 'dev-util/shellcheck-0.9.0-r2::gentoo ~amd64' | sudo tee -a /etc/portage/package.accepted_keyworks/dev-util/shellcheck
fi

sudo emerge -n dev-util/shellcheck
