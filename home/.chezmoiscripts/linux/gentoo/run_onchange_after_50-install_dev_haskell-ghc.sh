#!/usr/bin/env sh

if [ ! -f /etc/portage/package.accept_keywords/dev-lang/ghc ]; then
  if [ ! -d /etc/portage/package.accept_keywords/dev-lang ]; then
    sudo mkdir -p /etc/portage/package.accept_keywords/dev-lang
  fi
fi

echo '=dev-lang/ghc-9.2.8' | sudo tee -a /etc/portage/package.accept_keywords/dev-lang/ghc
echo 'dev-haskell/*' | sudo tee -a /etc/portage/package.accept_keywords/dev-haskell

sudo emerge -n dev-lang/ghc
