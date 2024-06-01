#!/usr/bin/env sh

exit_with_error() {
	echo "lib.sh: $1"
	exit 1
}

standard_utils() {
  script="
    .[]
    | .install.linux.$1.\"$2\"
      // .installs.linux.alpine.common
      // .installs.linux.common
      // .installs.common
      // .name
    | select(. as \$in | ['#builtin', '#script', '#na'] | index(\$in) | not)
  "

  utils=$(jq -r "$script" ~/.config/dotfiles/utils/standard.json)
}
