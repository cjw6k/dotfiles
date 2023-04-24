#!/usr/bin/env bash

# hard-coded architecture and version numbers, better is an apt repository for dotfiles, or build from source
curl -sLO https://github.com/dandavison/delta/releases/download/0.15.1/git-delta_0.15.1_amd64.deb \
  && dpkg -i git-delta_0.15.1_amd64.deb \
  && rm git-delta_0.15.1_amd64.deb
