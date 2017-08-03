FROM debian:jessie
MAINTAINER GitLab Inc. <support@gitlab.com>

RUN apt-get update -q \
        && apt-get install -y gcc git make curl zlib1g-dev libssl-dev \
        && rm -rf /var/lib/apt/lists/*

ENV RUBY_VERSION 2.3.3

RUN curl -fsSL "https://cache.ruby-lang.org/pub/ruby/2.3/ruby-${RUBY_VERSION}.tar.gz" \
  | tar -xzC /tmp \
  && cd /tmp/ruby-2.3.3 \
  && ./configure --disable-install-rdoc --disable-install-doc --disable-install-capi\
  && make \
  && make install

RUN gem install bundler

