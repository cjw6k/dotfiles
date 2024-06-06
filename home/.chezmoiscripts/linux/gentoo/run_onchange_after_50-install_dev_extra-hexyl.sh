#!/usr/bin/env sh

curl -sLO https://github.com/sharkdp/hexyl/releases/download/v0.14.0/hexyl-v0.14.0-x86_64-unknown-linux-gnu.tar.gz \
  && tar xzf hexyl-v0.14.0-x86_64-unknown-linux-gnu.tar.gz hexyl-v0.14.0-x86_64-unknown-linux-gnu/hexyl \
  && mv hexyl-v0.14.0-x86_64-unknown-linux-gnu/hexyl ~/.local/bin \
  && rm -r hexyl-v0.14.0-x86_64-unknown-linux-gnu \
  && rm hexyl-v0.14.0-x86_64-unknown-linux-gnu.tar.gz
