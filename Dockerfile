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
    openjdk-7-jdk \
    git \
    openssh-client \
    openssh-server \
    && rm -r /var/lib/apt/lists/*

ENV JAVA_HOME=/usr/lib/jvm/default-jvm

RUN useradd -m --shell /bin/bash -d /home/jenkins jenkins && \
#  cd ~jenkins && \
#  pwd && \
#  passwd -u jenkins && \
  chown -R jenkins:jenkins /home/jenkins && \
  echo "jenkins:jenkins" | chpasswd && \
  ln -sf "${JAVA_HOME}/bin/"* "/usr/bin/"

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
EXPOSE 80
EXPOSE 22
ENTRYPOINT ["/entrypoint.sh"]
