ARG SOURCE_IMAGE
ARG SOURCE_TAG

###
### debian, ubuntu
###
FROM ${SOURCE_IMAGE}:${SOURCE_TAG} as apt

# hadolint ignore=DL3008,DL3009
RUN apt-get update && apt-get install -y curl sudo --no-install-recommends

RUN sh -c "$(curl -fsLS get.chezmoi.io)" -- -b /usr/local/bin


###
### alpine
###
FROM ${SOURCE_IMAGE}:${SOURCE_TAG} as apk

# hadolint ignore=DL3018,DL3019
RUN apk --update add chezmoi
