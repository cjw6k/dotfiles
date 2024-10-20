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
  echo '=dev-haskell/parsec-3.1.15.0-r1 ~amd64' | sudo tee -a /etc/portage/package.accept_keywords/dev-haskell/parsec
  echo '=dev-haskell/quickcheck-2.14.3 ~amd64' | sudo tee -a /etc/portage/package.accept_keywords/dev-haskell/quickcheck
  echo '=dev-haskell/regex-tdfa-1.3.2.2 ~amd64' | sudo tee -a /etc/portage/package.accept_keywords/dev-haskell/regex-tdfa
  echo '=dev-haskell/fgl-5.8.1.1 ~amd64' | sudo tee -a /etc/portage/package.accept_keywords/dev-haskell/fgl
  echo '=dev-haskell/regex-base-0.94.0.2 ~amd64' | sudo tee -a /etc/portage/package.accept_keywords/dev-haskell/regex-base
  echo '=dev-haskell/text-1.2.5.0-r1 ~amd64' | sudo tee -a /etc/portage/package.accept_keywords/dev-haskell/text
fi

sudo emerge -n dev-util/shellcheck
