FROM ubuntu:trusty
MAINTAINER Spencer Judd <spencercjudd@gmail.com>

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    build-essential \
    git-core \
    libcurl4-gnutls-dev \
    libxml2 \
    libxml2-dev \
    libxslt1-dev \
    ruby-dev \
 && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/wpscanteam/wpscan.git \
 && cd wpscan \
 && gem install bundler \
 && bundle install --without test

ENTRYPOINT ["/wpscan/wpscan.rb"]
