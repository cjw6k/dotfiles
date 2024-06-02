#!/usr/bin/env sh

installation_sources_filter() {
  filter=".[] |"
  if test -n "$3"; then
    filter="$filter .installs.$1.$2.\"$3\" // .installs.$1.$2.common //"
  else
    filter="$filter .installs.$1.$2 //"
  fi

  filter="$filter .installs.$1.common // .installs.common // .name"
}

filter_utils() {
  installation_sources_filter "$3" "$4" "$5"
  utils=$(jq -rs "$filter $2" "$HOME/.config/dotfiles/utils/$1.json")
}

standard_utils() {
  filter_utils standard "| select(. | startswith(\"#\") | not)" "$1" "$2" "$3"
}

dev_utils() {
  filter_utils "dev/*" "| select(. | startswith(\"#\") | not)" "$1" "$2" "$3"
}
