#!/usr/bin/env sh

chezmoi () {
  echo "chezmoi init --apply $1"
}

usage () {
  echo "usage: init-dotfiles-command.sh DISTRO VERSION"
}

if [ $# -lt 2 ]; then
  usage
  exit 1
fi

distro () {
  usage
  echo " DISTRO must be one of: alpine, debian, or ubuntu"
}

alpine () {
  usage
  echo " when DISTRO is alpine, VERSION must be one of: edge, 3.22, 3.21, 3.20, or 3.19"
}

case $1 in
  alpine)
    case $2 in
      edge|3.22|3.21|3.20|3.19)
        chezmoi cjw6k
        ;;

      *)
        alpine
        exit 1
        ;;

    esac
    ;;

  debian)
    chezmoi cjw6k
    ;;

  ubuntu)
    chezmoi cjw6k
    ;;

  *)
    distro
    exit 1
    ;;

esac
