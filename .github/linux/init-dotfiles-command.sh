#!/usr/bin/env bash

set -euo pipefail

chezmoi () {
  echo "chezmoi init --apply $1"
}

usage () {
  echo "usage: init-dotfiles-command.sh DISTRO VERSION"
}

if [[ $# -lt 2 ]]; then
  usage
  exit 1
fi

distro () {
  usage
  echo " DISTRO must be one of: alpine"
}

alpine () {
  usage
  echo " when DISTRO is alpine, VERSION must be one of: edge, or v3.17"
}

case $1 in
  alpine)
    case $2 in
      edge)
        chezmoi cjw6k
        ;;

      v3.17)
        chezmoi "--guess-repo-url=false https://github.com/cjw6k/dotfiles.git"
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
