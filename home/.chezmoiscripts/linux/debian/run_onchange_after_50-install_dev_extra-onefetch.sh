#!/usr/bin/env sh

curl -sLO https://github.com/o2sh/onefetch/releases/download/2.21.0/onefetch-linux.tar.gz \
  && tar xzf onefetch-linux.tar.gz ./onefetch \
  && mv ./onefetch ~/.local/bin \
  && rm onefetch-linux.tar.gz
