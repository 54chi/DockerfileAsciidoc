FROM node:alpine

# Using the latest version of NODE alpine instead (so we also have node in the mix)

ARG ASCIIDOCTOR_VERSION="1.5.6.1"
ENV asciidoctor_version=${ASCIIDOCTOR_VERSION}

RUN apk add --no-cache \
    bash \
    curl \
    ca-certificates \
    findutils \
    graphviz \
    make \
    openjdk8-jre \
    py2-pillow \
    python2 \
    ruby \
    ruby-pygments \
    ttf-liberation \
    unzip \
    which \
  && apk add --no-cache --virtual .makedepends \
    build-base \
    libxml2-dev \
    python2-dev \
    py2-pip \
    ruby-dev \
    libffi-dev \
  && gem install --no-document asciidoctor --version "${asciidoctor_version}" \
  && gem install --no-document asciidoctor-pdf --version 1.5.0.alpha.16 \
  && gem install --no-document asciidoctor-diagram \
  && gem install --no-document rake rouge coderay thread_safe slim haml tilt \
  && gem install --no-document compass \
  && gem install --no-document zurb-foundation \
  && pip install --no-cache-dir --upgrade pip \
  && pip install --no-cache-dir seqdiag actdiag nwdiag 'blockdiag[pdf]' \
  && apk del -r --no-cache .makedepends

WORKDIR /documents
VOLUME /documents

CMD ["/bin/bash"]
