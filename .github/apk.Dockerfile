ARG SOURCE_IMAGE
ARG SOURCE_TAG

###
### alpine
###
FROM ${SOURCE_IMAGE}:${SOURCE_TAG}

# hadolint ignore=DL3018,DL3019
RUN apk --update add chezmoi
