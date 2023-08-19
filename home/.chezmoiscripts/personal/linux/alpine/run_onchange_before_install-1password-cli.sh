#!/usr/bin/env sh

echo https://downloads.1password.com/linux/alpinelinux/stable/ | sudo tee -a /etc/apk/repositories
sudo wget https://downloads.1password.com/linux/keys/alpinelinux/support@1password.com-61ddfc31.rsa.pub -P /etc/apk/keys
sudo apk update && sudo apk add 1password-cli
