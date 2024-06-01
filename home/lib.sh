#!/usr/bin/env sh

build_jq_filter() {
  filter=".[] |"
  if test -n "$3"; then
    filter="$filter .installs.$1.$2.\"$3\" // .installs.$1.$2.common //"
  else
    filter="$filter .installs.$1.$2 //"
  fi

  filter="$filter .installs.$1.common // .installs.common // .name"
  filter="$filter | select(. as \$in | [\"#builtin\", \"#script\", \"#na\"] | index(\$in) | not)"
}

run_jq_filter() {
    filter "$2" "$3" "$4"
    utils=$(jq -r "$filter" "$HOME/.config/dotfiles/utils/$1.json")
}

standard_utils() {
  run_jq_filter standard "$1" "$2" "$3"
}
