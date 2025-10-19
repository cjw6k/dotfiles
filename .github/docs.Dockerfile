# container dependencies
ARG PLANTUML_VERSION=1.2025.9
ARG PLANTUML_HASH=sha256:e8ef9dcda5945449181d044fc5d74d629b5b204c61c80fd328edeef59d19ffe8
ARG PYTHON_VERSION=3.13.9-alpine3.22
ARG PYTHON_HASH=sha256:e5fa639e49b85986c4481e28faa2564b45aa8021413f31026c3856e5911618b1

# configs
ARG GID=1000
ARG UID=1000

# apk
ARG FONT_DEJAVU_VERSION=2.37-r6
ARG FONT_DEJAVU_SANS_MONO_NERD_VERSION=3.2.1-r0
ARG FONT_INTER=4.1-r1
ARG GRAPHVIZ_VERSION=12.2.1-r0
ARG IMAGEMAGICK_VERSION=7.1.2.3-r0
ARG MAKE_VERSION=4.4.1-r3
ARG OPENJDK_VERSION=21.0.8_p9-r0
ARG SHELLCHECK_VERSION=0.10.0-r1

# pip
ARG PILLOW_VERSION=12.0.0
ARG PIP_VERSION=25.2.0
ARG SPHINX_CONTRIB_PLANTUML_VERSION=0.31
ARG SPHINX_RTD_DARK_MODE_VERSION=1.3.0
ARG SPHINX_RTD_THEME_VERSION=3.0.2
ARG SPHINX_VERSION=8.2.3

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

WORKDIR /opt/docs

CMD ["sphinx-build", "-M", "html", "source", "_build"]

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
