#!/usr/bin/env sh

if [ ! -f /etc/portage/package.accept_keywords/dev-haskell/cabal-install ]; then
  if [ ! -d /etc/portage/package.accept_keywords/dev-haskell ]; then
    sudo mkdir -p /etc/portage/package.accept_keywords/dev-haskell
  fi
fi

echo '=dev-haskell/cabal-install-3.6.2.0-r1' | sudo tee -a /etc/portage/package.accept_keywords/dev-haskell/cabal-install
