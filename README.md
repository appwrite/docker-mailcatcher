# Docker MailCatcher

[![Discord](https://img.shields.io/discord/564160730845151244?label=discord&style=flat-square)](https://appwrite.io/discord)
[![Docker Pulls](https://img.shields.io/docker/pulls/appwrite/mailcatcher?color=f02e65&style=flat-square)](https://hub.docker.com/r/appwrite/mailcatcher)
[![Build Status](https://img.shields.io/travis/com/appwrite/docker-mailcatcher?style=flat-square)](https://travis-ci.com/appwrite/docker-mailcatcher)
[![Twitter Account](https://img.shields.io/twitter/follow/appwrite_io?color=00acee&label=twitter&style=flat-square)](https://twitter.com/appwrite_io)
[![Follow Appwrite on StackShare](https://img.shields.io/badge/follow%20on-stackshare-blue?style=flat-square)](https://stackshare.io/appwrite)

The MailCatcher docker container is used for capturing and debugging emails sent during app development. This container is based on the djfarrelly/maildev docker image with Appwrite specific configuration settings. For a fresh installation of djfarrelly/maildev image use the [docker original image](https://github.com/maildev/maildev).

## Getting Started

These instructions will cover usage information to help you run the Appwrite's MailCatcher docker container.

### Prerequisities

In order to run this container you'll need docker installed on the system.

* [Windows](https://docs.docker.com/docker-for-windows/install/)
* [OS X](https://docs.docker.com/docker-for-mac/install/)
* [Linux](https://docs.docker.com/engine/install/)

Refer [docs](https://docs.docker.com/) for general documentation and guides for using docker.

### Usage

```shell
docker run appwrite/mailcatcher
```

### Environment Variables

This container supports all environment variables supplied by the original djfarrelly/maildev Docker image.

### Build

```bash
docker build --tag appwrite/mailcatcher:1.0.0 .

docker push appwrite/mailcatcher:1.0.0
```

Multi-arch build (experimental using [buildx](https://github.com/docker/buildx)):

```
docker buildx build --platform linux/amd64,linux/arm64/v8,linux/ppc64le --tag appwrite/mailcatcher:1.0.0 --push .
```
## Push
```bash
docker push appwrite/mailcatcher:1.0.0
```

## Find Us

* [GitHub](https://github.com/appwrite)
* [Discord](https://appwrite.io/discord)
* [Twitter](https://twitter.com/appwrite_io)

## Copyright and license

The MIT License (MIT) [http://www.opensource.org/licenses/mit-license.php](http://www.opensource.org/licenses/mit-license.php)

