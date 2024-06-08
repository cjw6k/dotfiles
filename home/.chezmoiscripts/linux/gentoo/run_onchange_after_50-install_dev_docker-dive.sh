#!/usr/bin/env sh

curl -sLO https://github.com/wagoodman/dive/releases/download/v0.12.0/dive_0.12.0_linux_amd64.tar.gz \
  && tar xzf dive_0.12.0_linux_amd64.tar.gz dive \
  && mv ./dive ~/.local/bin \
  && rm dive_0.12.0_linux_amd64.tar.gz
