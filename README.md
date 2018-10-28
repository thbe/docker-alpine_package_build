# Alpine Package Build on Docker

[![Build Status](https://img.shields.io/docker/automated/thbe/alpine_package_build.svg)](https://hub.docker.com/r/thbe/alpine_package_build/builds/) [![GitHub Stars](https://img.shields.io/github/stars/thbe/docker-alpine_package_build.svg)](https://github.com/thbe/docker-alpine_package_build/stargazers) [![Docker Stars](https://img.shields.io/docker/stars/thbe/alpine_package_build.svg)](https://hub.docker.com/r/thbe/alpine_package_build) [![Docker Pulls](https://img.shields.io/docker/pulls/thbe/alpine_package_build.svg)](https://hub.docker.com/r/thbe/alpine_package_build)

This is a Docker image to run an Alpine Package Build instance with aport pre-configured.

This Docker image is based on the offical [Alpine](https://hub.docker.com/r/_/alpine/) image.

#### Table of Contents

- [Install Docker](https://github.com/thbe/docker-alpine_package_build#install-docker)
- [Download](https://github.com/thbe/docker-alpine_package_build#download)
- [How to use this image](https://github.com/thbe/docker-alpine_package_build#how-to-use-this-image)
- [Next steps](https://github.com/thbe/docker-alpine_package_build#next-steps)
- [Important notes](https://github.com/thbe/docker-alpine_package_build#important-notes)
- [Update Docker image](https://github.com/thbe/docker-alpine_package_build#update-docker-image)
- [Advanced usage](https://github.com/thbe/docker-alpine_package_build#advanced-usage)
- [Technical details](https://github.com/thbe/docker-alpine_package_build#technical-details)
- [Development](https://github.com/thbe/docker-alpine_package_build#development)

## Install Docker

To use this image you have to [install Docker](https://docs.docker.com/engine/installation/) first.

## Download

You can get the trusted build from the [Docker Hub registry](https://hub.docker.com/r/thbe/alpine_package_build/):

```
docker pull thbe/alpine_package_build
```

Alternatively, you may build the Docker image from the
[source code](https://github.com/thbe/docker-alpine_package_build#build-from-source-code) on GitHub.

## How to use this image

### Environment variables

You can use four environment variables that will be recognized by the build script.

#### `ABUILD_GIT_NAME`

If this environment variable is set, the string will be used to set the surname and lastname for the GIT user.

#### `ABUILD_GIT_EMAIL`

If this environment variable is set, the string will be used to set the email for the GIT user.

#### `ABUILD_GIT_SMTPSERVER`

If this environment variable is set, the string will be used to set the smtp server for the email patch submission.

#### `ABUILD_GIT_SMTPUSER`

If this environment variable is set, the string will be used to set the user for the smtp server authentication.

### Use the Alpine Package Build instance

The instance can be used with the following start command:

```
docker run --rm -ti local/alpine-package-builder /bin/sh
```

## Next steps

The next release of this Docker image should have a persistent alpine_package_build configuration.

## Important notes

The username for the print server is `root`/`password` unless you don't change the password with the environment
variable as described in the [Environment variables](https://github.com/thbe/docker-alpine_package_build#how-to-use-this-image)
section.

## Update Docker image

Simply download the trusted build from the [Docker Hub registry](https://hub.docker.com/r/thbe/alpine_package_build/):

```
docker pull thbe/alpine_package_build
```

## Advanced usage

### Build from source code

You can build the image also from source. To do this you have to clone the
[docker-alpine_package_build](https://github.com/thbe/docker-alpine_package_build) repository from GitHub:

```
git clone https://github.com/thbe/docker-alpine_package_build.git
cd docker-alpine_package_build
docker build --rm \
             --build-arg ABUILD_GIT_NAME="Surname Lastname"
             --build-arg ABUILD_GIT_EMAIL="user@domain.local"
             --build-arg ABUILD_GIT_SMTPSERVER="smtp.domain.local"
             --build-arg ABUILD_GIT_SMTPUSER="user@domain.local"
             -t local/alpine-package-builder .
```

## Technical details

- Alpine base image
- Alpine SDK

## Development

If you like to add functions or improve this Docker image, feel free to fork the repository and send me a merge request with the modification.
