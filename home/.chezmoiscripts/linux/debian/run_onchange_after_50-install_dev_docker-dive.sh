#!/usr/bin/env bash

curl -sLO https://github.com/wagoodman/dive/releases/download/v0.12.0/dive_0.12.0_linux_amd64.deb \
  && sudo dpkg -i dive_0.12.0_linux_amd64.deb \
  && rm dive_0.12.0_linux_amd64.deb
