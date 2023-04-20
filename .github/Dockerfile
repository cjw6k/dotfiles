ARG SOURCE_IMAGE
ARG SOURCE_TAG

FROM ${SOURCE_IMAGE}:${SOURCE_TAG}

# hadolint ignore=DL3008,DL3009
RUN apt-get update && apt-get install -y curl sudo --no-install-recommends
