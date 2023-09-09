ARG SOURCE_IMAGE
ARG SOURCE_TAG

###
### ci build
###
FROM ${SOURCE_IMAGE}:${SOURCE_TAG} as ci

# hadolint ignore=DL3008,DL3009
RUN apt-get update && apt-get install -y ca-certificates curl sudo --no-install-recommends

RUN sh -c "$(curl -fsLS get.chezmoi.io)" -- -b /usr/local/bin

RUN groupadd -r ci \
 && useradd -r ci -g ci -m \
 && echo 'ci ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/ci

###
### final build
###
FROM ci as final

ARG OWNER
ARG DEVTOOLS=""

USER ci
WORKDIR /home/ci

# hadolint ignore=DL3004
RUN DOTFILES_DEVTOOLS=${DEVTOOLS} chezmoi init --apply "${OWNER}" \
 && sudo rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/usr/bin/fish"]
