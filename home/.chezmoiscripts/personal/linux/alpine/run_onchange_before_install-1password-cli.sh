#!/usr/bin/env sh

echo https://downloads.1password.com/linux/alpinelinux/stable/ >> /etc/apk/repositories
wget https://downloads.1password.com/linux/keys/alpinelinux/support@1password.com-61ddfc31.rsa.pub -P /etc/apk/keys
apk update && apk add 1password-cli
