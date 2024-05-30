#!/usr/bin/env/fish

curl -Lo task.tar.gz https://github.com/go-task/task/releases/download/v3.37.2/task_freebsd_amd64.tar.gz \
  && tar xzf task.tar.gz \
  && mv task ~/.local/bin \
  && rm task.tar.gz
