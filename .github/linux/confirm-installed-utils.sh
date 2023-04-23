#!/usr/bin/env sh

if [ $# -ne 2 ]; then
  echo "usage: confirm-installed-utils.sh DISTRO VERSION"
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

selection=$(echo "$partial" | jq -r '. | select(.provides == null) | .name')
if [ $? -ne 0 ]; then
  echo 'Failed parsing .[].provides from utils.json'
  exit 1
fi
for i in $selection; do
  check "$i"
  if [ $? -ne 0 ]; then
    missed=$((missed + 1))
  fi
done

selection=$(echo "$partial" | jq -r '. | select(.provides.common != null) | .provides.common[]')
if [ $? -ne 0 ]; then
  echo 'Failed parsing .[].provides.commmon from utils.json'
  exit 1
fi
for i in $selection; do
  check "$i"
  if [ $? -ne 0 ]; then
    missed=$((missed + 1))
  fi
done

selection=$(echo "$partial" | jq -r '. | select(.provides.linux.common != null) | .provides.linux.common[]')
if [ $? -ne 0 ]; then
  echo 'Failed parsing .[].provides.linux.common from utils.json'
  exit 1
fi
for i in $selection; do
  check "$i"
  if [ $? -ne 0 ]; then
    missed=$((missed + 1))
  fi
done

selection=$(echo "$partial" | jq -r ". | select(.provides.linux.\"$1\".common != null) | .provides.linux.\"$1\".common[]")
if [ $? -ne 0 ]; then
  echo "Failed parsing .[].provides.linux.\"$1\".common from utils.json"
  exit 1
fi
for i in $selection; do
  check "$i"
  if [ $? -ne 0 ]; then
    missed=$((missed + 1))
  fi
done

selection=$(echo "$partial" | jq -r ". | select(.provides.linux.\"$1\".\"$2\" != null) | .provides.linux.\"$1\".\"$2\"[]")
if [ $? -ne 0 ]; then
  echo "Failed parsing .[].provides.linux.\"$1\".\"$2\" from utils.json"
  exit 1
fi
for i in $selection; do
  check "$i"
  if [ $? -ne 0 ]; then
    missed=$((missed + 1))
  fi
done

if [ $missed -ne 0 ]; then
  echo "Required utilities are not present"
  exit 1
fi
