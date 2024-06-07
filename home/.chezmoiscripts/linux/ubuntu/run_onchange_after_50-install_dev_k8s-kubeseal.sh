#!/usr/bin/env sh

curl -sLO https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.26.3/kubeseal-0.26.3-linux-amd64.tar.gz \
  && tar xzf kubeseal-0.26.3-linux-amd64.tar.gz kubeseal \
  && mv ./kubeseal ~/.local/bin \
  && rm kubeseal-0.26.3-linux-amd64.tar.gz
