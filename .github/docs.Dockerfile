# container dependencies
ARG ALPINE_VERSION=3.20.3
ARG ALPINE_HASH=sha256:beefdbd8a1da6d2915566fde36db9db0b524eb737fc57cd1367effd16dc0d06d
ARG PLANTUML_VERSION=1.2024.7
ARG PLANTUML_HASH=sha256:13d9a291cbbc0b028d0d6d1804bdd7bed430de60936ccf9cdff17e464d0da00a
ARG PYTHON_VERSION=3.13.0-alpine3.20
ARG PYTHON_HASH=sha256:c38ead8bcf521573dad837d7ecfdebbc87792202e89953ba8b2b83a9c5a520b6

# configs
ARG GID=1000
ARG UID=1000
ARG WORKDIR=/opt/docs

# apk
ARG FONT_DEJAVU_VERSION=2.37-r5
ARG FONT_DEJAVU_SANS_MONO_NERD_VERSION=3.2.1-r0
ARG FONT_INTER=4.0-r0
ARG GRAPHVIZ_VERSION=9.0.0-r2
ARG IMAGEMAGICK_VERSION=7.1.1.32-r2
ARG MAKE_VERSION=4.4.1-r2
ARG OPENJDK_VERSION=21.0.4_p7-r0
ARG SHELLCHECK_VERSION=0.10.0-r1

# pip
ARG PILLOW_VERSION=11.0.0
ARG PIP_VERSION=24.2.0
ARG SPHINX_CONTRIB_PLANTUML_VERSION=0.30
ARG SPHINX_RTD_DARK_MODE_VERSION=1.3.0
ARG SPHINX_RTD_THEME_VERSION=3.0.1
ARG SPHINX_VERSION=8.1.3

###
### sphinx
###  - the official sphinx image on docker hub is a few months behind on releases
###
FROM python:${PYTHON_VERSION}@${PYTHON_HASH} AS sphinx

ARG GRAPHVIZ_VERSION
ARG IMAGEMAGICK_VERSION
ARG MAKE_VERSION
ARG PILLOW_VERSION
ARG PIP_VERSION
ARG SPHINX_VERSION

ARG UID
ARG GID

RUN apk add --no-cache \
      graphviz=${GRAPHVIZ_VERSION} \
      imagemagick=${IMAGEMAGICK_VERSION} \
      make=${MAKE_VERSION}

RUN addgroup -g ${GID} sphinx \
 && adduser -u ${UID} -h /home/sphinx -s /sbin/nologin -D -G sphinx -g sphinx sphinx

ENV PATH="$PATH:/home/sphinx/.local/bin"

USER sphinx

RUN pip install --no-cache-dir --upgrade pip==${PIP_VERSION} \
 && pip install --no-cache-dir \
      pillow==${PILLOW_VERSION} \
      sphinx==${SPHINX_VERSION}

WORKDIR /docs

CMD ["sphinx-build", "-M", "html", ".", "_build"]

###
### plantuml
###
FROM plantuml/plantuml:${PLANTUML_VERSION}@${PLANTUML_HASH} AS plantuml

###
### docs
###
FROM sphinx AS docs

ARG FONT_DEJAVU_VERSION
ARG FONT_DEJAVU_SANS_MONO_NERD_VERSION
ARG FONT_INTER
ARG OPENJDK_VERSION
ARG PIP_VERSION
ARG SPHINX_CONTRIB_HTTP_VERSION
ARG SPHINX_CONTRIB_PHP_VERSION
ARG SPHINX_CONTRIB_PLANTUML_VERSION
ARG SPHINX_RTD_DARK_MODE_VERSION
ARG SPHINX_RTD_THEME_VERSION

USER root

RUN apk add --no-cache \
      font-dejavu=${FONT_DEJAVU_VERSION} \
      font-dejavu-sans-mono-nerd=${FONT_DEJAVU_SANS_MONO_NERD_VERSION} \
      font-inter=${FONT_INTER} \
      openjdk21-jre=${OPENJDK_VERSION}

COPY --from=plantuml /opt/plantuml.jar /opt/plantuml/plantuml.jar

USER sphinx

RUN pip install --no-cache-dir --upgrade pip==${PIP_VERSION} \
 && pip install --no-cache-dir \
      sphinx-rtd-dark-mode==${SPHINX_RTD_DARK_MODE_VERSION} \
      sphinx-rtd-theme==${SPHINX_RTD_THEME_VERSION} \
      sphinxcontrib-plantuml==${SPHINX_CONTRIB_PLANTUML_VERSION} \
