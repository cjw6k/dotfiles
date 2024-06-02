#!/usr/bin/env sh

curl -sLO https://github.com/kubernetes-sigs/kind/releases/download/v0.23.0/kind-linux-amd64 \
  && mv ./kind-linux-amd64 ~/.local/bin
