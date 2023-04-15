#!/usr/bin/env bash

set -euo pipefail

chezmoi () {
  echo "chezmoi init --apply $1"
}

usage () {
  echo "usage: install-dotfiles-command.sh DISTRO VERSION"
}

distro () {
  usage
  echo " DISTRO must be one of: alpine"
}

alpine () {
  usage
  echo " when DISTRO is alpine, VERSION must be one of: edge"
}

if [[ -v $1 ]]; then
  distro
  exit 1
fi

case $1 in
  alpine)
    if [[ -v $2 ]]; then
      alpine
      exit 1
    fi
    case $2 in
      edge)
        chezmoi cjw6k
        ;;

      *)
        alpine
        exit 1
        ;;

    esac
    ;;

  *)
    distro
    exit 1
    ;;

esac