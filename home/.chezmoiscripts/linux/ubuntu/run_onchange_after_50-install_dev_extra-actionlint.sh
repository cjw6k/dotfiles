#!/usr/bin/env sh

curl -sLO https://github.com/rhysd/actionlint/releases/download/v1.7.1/actionlint_1.7.1_linux_amd64.tar.gz \
  && tar xzf actionlint_1.7.1_linux_amd64.tar.gz actionlint \
  && mv ./actionlint ~/.local/bin \
  && rm actionlint_1.7.1_linux_amd64.tar.gz
