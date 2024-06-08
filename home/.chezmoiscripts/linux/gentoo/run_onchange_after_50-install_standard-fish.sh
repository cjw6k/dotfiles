#!/usr/bin/env sh

if [ ! -f /etc/portage/package.accept_keywords/app-shells/fish ]; then
  if [ ! -d /etc/portage/package.accept_keywords/app-shells ]; then
    sudo mkdir -p /etc/portage/package.accept_keywords/app-shells
  fi

  echo '=app-shells/fish-3.7.1' | sudo tee /etc/portage/package.accept_keys/app-shells/fish
fi

sudo emerge -n app-shells/fish
