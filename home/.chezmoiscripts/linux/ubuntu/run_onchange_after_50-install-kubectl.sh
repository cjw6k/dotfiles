#!/usr/bin/env sh

curl -sLO https://dl.k8s.io/release/v1.30.1/bin/linux/amd64/kubectl \
  && mv ./kubectl ~/.local/bin \
  && chmod +x ~/.local/bin/kubectl
