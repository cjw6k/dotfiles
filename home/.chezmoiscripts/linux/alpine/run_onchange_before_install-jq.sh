#!/usr/bin/env bash

set -euo pipefail

# ~/.config/dotfiles/utils.json hash:
# {{ include "private_dot_config/dotfiles/utils.json" | sha256sum }}

apk add jq
