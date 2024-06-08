#!/usr/bin/env sh

curl -sLO https://github.com/lycheeverse/lychee/releases/download/v0.15.1/lychee-v0.15.1-x86_64-unknown-linux-musl.tar.gz \
  && tar xzf lychee-v0.15.1-x86_64-unknown-linux-musl.tar.gz lychee \
  && mv ./lychee ~/.local/bin \
  && rm lychee-v0.15.1-x86_64-unknown-linux-musl.tar.gz
