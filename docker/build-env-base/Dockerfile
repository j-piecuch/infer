FROM phusion/baseimage:latest-amd64

ENV HOME /root

# mkdir the man/man1 directory due to Debian bug #863199
RUN apt-get update && \
    apt-get install --yes --no-install-recommends \
      autoconf \
      automake \
      bubblewrap \
      bzip2 \
      cmake \
      curl \
      g++ \
      gcc \
      git \
      libc6-dev \
      libgmp-dev \
      libmpfr-dev \
      libsqlite3-dev \
      make \
      openjdk-8-jdk-headless \
      patch \
      patchelf \
      pkg-config \
      python2.7 \
      sudo \
      tzdata \
      unzip \
      xz-utils \
      zlib1g-dev

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
