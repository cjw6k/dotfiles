#!/usr/bin/env sh

which jq >> /dev/null
if [ $? -ne 0 ]; then
  exit 1
fi

if [ -d "/home/ci/.local/bin" ]; then
  export PATH="/home/ci/.local/bin:$PATH"
fi

partial=$(jq '.[] | select(.personal != true)' /home/ci/.config/dotfiles/utils.json)

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

for i in $(echo "$partial" | jq -r '. | select(.provides.freebsd.common != null) | .provides.freebsd.common[]'); do
  check "$i"
  if [ $? -ne 0 ]; then
    missed=$((missed + 1))
  fi
done

if [ $missed -ne 0 ]; then
  echo "Required utilities are not present"
  exit 1
fi
