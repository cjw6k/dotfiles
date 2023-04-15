#!/usr/bin/env sh

partial=$(jq '.[] | select(.type != "personal" and .type != "psmodule")' \
  ~/.config/dotfiles/utils.json)

check () {
    ident=$(which "$1")
    if [ $? -eq 0 ]; then
      echo "✔️ $1 is $ident"
      return 0
    else
      echo "❌ $1 is missing"
      return 1
    fi
}

missed=0

for i in $(echo "$partial" | jq -r '. | select(.provides == null) | .name'); do
  check "$i"
  if [ $? -ne 0 ]; then
    missed=$((missed + 1))
  fi
done

for i in $(echo "$partial" | jq -r '. | select(.provides != null) | .provides.shared[]'); do
  check "$i"
  if [ $? -ne 0 ]; then
    missed=$((missed + 1))
  fi
done

if [ $missed -ne 0 ]; then
  echo "Required utilities are not present"
  exit 1
fi
