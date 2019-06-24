FROM ubuntu:18.04

ENV DART_CHANNEL='stable'
ENV DART_VERSION='2.3.2'

RUN apt-get update -qq && apt-get install -y \
    build-essential \
    curl \
    git \
    make \
    unzip \
    wget \
    xvfb \
    && rm -rf /var/lib/apt/lists/*

# Install Dart
RUN wget https://storage.googleapis.com/dart-archive/channels/${DART_CHANNEL}/release/${DART_VERSION}/sdk/dartsdk-linux-x64-release.zip \
    && unzip dartsdk-linux-x64-release.zip \
    && cp dart-sdk/* /usr/local -r \
    && rm -rf dartsdk-linux-x64-release.zip

# Make directory for application
RUN mkdir -p /usr/local/app && chmod -R 777 /usr/local/app

WORKDIR /usr/local/

EXPOSE 80

COPY server/config/dart/docker-entrypoint.sh /
ENTRYPOINT ["sh", "/docker-entrypoint.sh"]
