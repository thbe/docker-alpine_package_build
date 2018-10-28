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

You can use two environment variables that will be recognized by the build script.

#### `alpine_package_build_PASSWORD`

If this environment variable is set, the string will be used as the password for the `root` user.

#### `alpine_package_build_DEBUG`

If this environment variable is set, the scripts inside the container will run in debug mode.

### Start the alpine_package_build instance

The instance can be started by the [start script](https://raw.githubusercontent.com/thbe/docker-alpine_package_build/master/start_alpine_package_build.sh)
from GitHub:

```
wget https://raw.githubusercontent.com/thbe/docker-alpine_package_build/master/start_alpine_package_build.sh
export alpine_package_build_PASSWORD='SeCre!1'
chmod 755 start_alpine_package_build.sh
./start_alpine_package_build.sh
```

### Check server status

You can use the standard Docker commands to examine the status of the alpine_package_build instance:

```
docker logs --tail 1000 --follow --timestamps alpine_package_build
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
docker build --rm --no-cache -t thbe/alpine_package_build .
```

### Bash shell inside container

If you need a shell inside the container you can run the following command:

```
docker exec -ti alpine_package_build /bin/sh
```

## Technical details

- Alpine base image
- alpine_package_build binary from official Alpine package repository

## Development

If you like to add functions or improve this Docker image, feel free to fork the repository and send me a merge request with the modification.
