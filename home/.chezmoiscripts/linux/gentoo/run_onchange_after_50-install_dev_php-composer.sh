#!/usr/bin/env sh

if [ ! -f /etc/portage/package.use/dev-php/composer ]; then
  if [ ! -d /etc/portage/package.use/dev-php ]; then
    sudo mkdir -p /etc/portage/package.use/dev-php
  fi

  echo '>=dev-lang/php-8.2.18 curl' | sudo tee -a /etc/portage/package.use/dev-php/composer
fi

sudo emerge -n dev-php/composer
