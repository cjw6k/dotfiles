#!/usr/bin/env sh

sudo sed -Ei '' "s/^($(whoami):.*:)([^:]*)$/\1$(which fish | sed 's/\//\\\//g')/" /etc/passwd
