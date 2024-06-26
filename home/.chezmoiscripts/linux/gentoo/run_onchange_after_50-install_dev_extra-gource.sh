#!/usr/bin/env sh

if [ ! -f /etc/portage/package.use/dev-util/gource ]; then
  if [ ! -d /etc/portage/package.use/dev-util ]; then
    sudo mkdir -p /etc/portage/package.use/dev-util
  fi

  echo '>=media-libs/libsdl2-2.28.5-r1 opengl X' | sudo tee -a /etc/portage/package.use/dev-util/gource
  echo '>=media-libs/sdl2-image-2.8.2 jpeg png' | sudo tee -a /etc/portage/package.use/dev-util/gource
  echo '>=media-libs/libglvnd-1.7.0 X' | sudo tee -a /etc/portage/package.use/dev-util/gource
fi

sudo emerge -n dev-util/gource
