#!/usr/bin/env sh

if [ $# -ne 2 ]; then
  echo "usage: confirm-installed-utils.sh DISTRO"
  exit 1
fi

which jq >> /dev/null
if [ $? -ne 0 ]; then
  exit 1
fi

partial=$(jq '.[] | select(.personal != true)' ~/.config/dotfiles/utils.json)

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

for i in $(echo "$partial" | jq -r '. | select(.provides.common != null) | .provides.common[]'); do
  check "$i"
  if [ $? -ne 0 ]; then
    missed=$((missed + 1))
  fi
done

for i in $(echo "$partial" | jq -r '. | select(.provides.linux.common != null) | .provides.lilnux.common[]'); do
  check "$i"
  if [ $? -ne 0 ]; then
    missed=$((missed + 1))
  fi
done

for i in $(echo "$partial" | jq -r ". | select(.provides.linux.$1 != null) | .provides.linux.$1[]"); do
  check "$i"
  if [ $? -ne 0 ]; then
    missed=$((missed + 1))
  fi
done

if [ $missed -ne 0 ]; then
  echo "Required utilities are not present"
  exit 1
fi
