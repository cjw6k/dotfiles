#!/usr/bin/env sh

curl -sLO https://github.com/hadolint/hadolint/releases/download/v2.12.0/hadolint-Linux-x86_64 \
  && mv ./hadolint-Linux-x86_64 ~/.local/bin/hadolint
