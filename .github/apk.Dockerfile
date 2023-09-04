ARG SOURCE_IMAGE
ARG SOURCE_TAG

###
### ci build
###
FROM ${SOURCE_IMAGE}:${SOURCE_TAG} as ci

# hadolint ignore=DL3018,DL3019
RUN apk --update add chezmoi sudo

RUN addgroup -S ci \
 && adduser -S ci -G ci -s /bin/sh \
 && echo 'ci ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/ci

###
### final build
###
FROM ci as final

ARG SOURCE_TAG
ARG REPO
ARG OWNER

USER ci
WORKDIR /home/ci

# hadolint ignore=DL3004
RUN if [ "${SOURCE_TAG}" = "3.17" ]; then \
      chezmoi init --apply --guess-repo-url=false "https://github.com/${REPO}.git" \
        --promptBool "Should this machine have development tools"=true; \
    else \
      chezmoi init --apply "${OWNER}" \
        --promptBool "Should this machine have development tools"=true; \
    fi \
 && sudo rm -rf /var/cache/apk/*

ENTRYPOINT ["/usr/bin/fish"]
