#!/usr/bin/env sh

source_filter() {
  sourceFilter=""
  if test -n "$3"; then
    sourceFilter="$sourceFilter .sources.$1.$2.\"$3\" // .sources.$1.$2.common //"
  else
    sourceFilter="$sourceFilter .sources.$1.\"$2\" //"
  fi

  sourceFilter="$sourceFilter .sources.$1.common // .sources.common // .name"
}

filter_utils() {
  source_filter "$3" "$4" "$5"
  # allow globbing
  # shellcheck disable=SC2086
  utils=$(jq -rs ".[][] | $sourceFilter $2" ~/.config/dotfiles/utils/$1.json)
}

standard_utils() {
  filter_utils standard "| select(. | startswith(\"#\") | not)" "$1" "$2" "$3"
}

dev_utils() {
  filter_utils "dev/*" "| select(. | startswith(\"#\") | not)" "$1" "$2" "$3"
}

pip_utils() {
  source_filter "$1" "$2" "$3"
  # allow globbing
  # shellcheck disable=SC2086
  utils=$(jq -rs ".[][] | select(($sourceFilter) == \"#pip\") | .name" ~/.config/dotfiles/utils/dev/*.json)
}
