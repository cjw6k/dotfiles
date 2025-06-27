# container dependencies
ARG ALPINE_VERSION=3.22.0@sha256:8a1f59ffb675680d47db6337b49d22281a139e9d709335b492be023728e11715
ARG PLANTUML_VERSION=1.2025.3@sha256:7d0f1cb94b31a4fa7984c108306b683a625621e306f098b41827465bb7600b34
ARG PYTHON_VERSION=3.13.5-alpine3.22@sha256:9b4929a72599b6c6389ece4ecbf415fd1355129f22bb92bb137eea098f05e975

# configs
ARG GID=1000
ARG UID=1000

# apk
ARG FONT_DEJAVU_VERSION=2.37-r6
ARG FONT_DEJAVU_SANS_MONO_NERD_VERSION=3.2.1-r0
ARG FONT_INTER=4.1-r1
ARG GRAPHVIZ_VERSION=12.2.1-r0
ARG IMAGEMAGICK_VERSION=7.1.1.44-r0
ARG MAKE_VERSION=4.4.1-r3
ARG OPENJDK_VERSION=21.0.7_p6-r0
ARG SHELLCHECK_VERSION=0.10.0-r2

# pip
ARG PILLOW_VERSION=11.0.0
ARG PIP_VERSION=25.1.1
ARG SPHINX_CONTRIB_PLANTUML_VERSION=0.30
# ARG SPHINX_RTD_THEME_VERSION=3.0.1
ARG SPHINX_VERSION=8.2.3

###
### sphinx
###  - the official sphinx image on docker hub is a few months behind on releases
###
FROM python:${PYTHON_VERSION} AS sphinx

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
FROM plantuml/plantuml:${PLANTUML_VERSION} AS plantuml

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
# ARG SPHINX_RTD_THEME_VERSION

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
      # sphinx-rtd-theme==${SPHINX_RTD_THEME_VERSION} \
      sphinxcontrib-plantuml==${SPHINX_CONTRIB_PLANTUML_VERSION}
