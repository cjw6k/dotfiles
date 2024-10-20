#!/usr/bin/env sh

if [ ! -f /etc/portage/package.accept_keywords/dev-util/shellcheck ]; then
  if [ ! -d /etc/portage/package.accept_keywords/dev-util ]; then
    sudo mkdir -p /etc/portage/package.accept_keywords/dev-util
  fi

  echo '=dev-util/shellcheck-0.9.0-r2 ~amd64' | sudo tee -a /etc/portage/package.accept_keywords/dev-util/shellcheck

  if [ ! -d /etc/portage/package.accept_keywords/dev-haskell ]; then
    sudo mkdir -p /etc/portage/package.accept_keywords/dev-haskell
  fi

  echo '=dev-haskell/aeson-2.0.3.0 ~amd64' | sudo tee -a /etc/portage/package.accept_keywords/dev-haskell/aeson
  echo '=dev-haskell/diff-0.4.1 ~amd64' | sudo tee -a /etc/portage/package.accept_keywords/dev-haskell/diff
fi

sudo emerge -n dev-util/shellcheck
