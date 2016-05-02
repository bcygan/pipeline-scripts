FROM ubuntu:latest

# install httpd runtime dependencies
# https://httpd.apache.org/docs/2.4/install.html#requirements

RUN apt-get install -y --no-install-recommends curl

RUN sh -c 'echo "deb http://opensource.wandisco.com/ubuntu precise svn18" >> /etc/apt/sources.list.d/subversion18.list' \
  && curl http://opensource.wandisco.com/wandisco-debian.gpg | sudo apt-key add - \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
    libapr1 \
    libaprutil1 \
    libapr1-dev \
    libaprutil1-dev \
    libpcre++0 \
    libssl1.0.0 \
    python \
    autoconf \
    libtool \
    ca-certificates \
    curl \
    bzip2 \
    gcc \
    libpcre++-dev \
    libssl-dev \
    make \
    xinetd \
    subversion \
    && rm -r /var/lib/apt/lists/*

EXPOSE 80
