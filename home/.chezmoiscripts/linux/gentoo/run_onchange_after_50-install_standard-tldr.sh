#!/usr/bin/env sh

curl -sLO https://github.com/tldr-pages/tlrc/releases/download/v1.9.2/tlrc-v1.9.2-x86_64-unknown-linux-gnu.tar.gz \
  && tar xzf tlrc-v1.9.2-x86_64-unknown-linux-gnu.tar.gz tldr \
  && mv ./tldr ~/.local/bin \
  && rm tlrc-v1.9.2-x86_64-unknown-linux-gnu.tar.gz
