#!/usr/bin/env sh

if [ ! -f /etc/portage/package.use/app-shells/fish ]; then
  if [ ! -d /etc/portage/package.use/app-shells ]; then
    sudo mkdir -p /etc/portage/package.use/app-shells
  fi

  echo '>=dev-libs/libpcre2-10.42-r1 pcre32' | sudo tee /etc/portage/package.use/app-shells/fish
fi

sudo emerge -n app-shells/fish && sudo chsh -s "$(which fish)" "$(whoami)"
