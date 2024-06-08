#!/usr/bin/env sh

curl -sLO https://github.com/XAMPPRocky/tokei/releases/download/v12.1.2/tokei-x86_64-unknown-linux-gnu.tar.gz \
  && tar xzf tokei-x86_64-unknown-linux-gnu.tar.gz tokei \
  && mv ./tokei ~/.local/bin \
  && rm tokei-x86_64-unknown-linux-gnu.tar.gz
