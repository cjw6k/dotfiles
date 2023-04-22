ARG SOURCE_IMAGE
ARG SOURCE_TAG

###
### debian, ubuntu
###
FROM ${SOURCE_IMAGE}:${SOURCE_TAG}

# hadolint ignore=DL3008,DL3009
RUN apt-get update && apt-get install -y ca-certificates curl sudo --no-install-recommends

RUN sh -c "$(curl -fsLS get.chezmoi.io)" -- -b /usr/local/bin
