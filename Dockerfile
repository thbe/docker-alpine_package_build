FROM alpine:latest
#
# BUILD:
#   wget https://raw.githubusercontent.com/thbe/virtual-docker/master/demo/alpine-build/Dockerfile
#   docker build --rm \
#                --build-arg ABUILD_GIT_NAME="Surname Lastname"
#                --build-arg ABUILD_GIT_EMAIL="user@domain.local"
#                --build-arg ABUILD_GIT_SMTPSERVER="smtp.domain.local"
#                --build-arg ABUILD_GIT_SMTPUSER="user@domain.local"
#                -t local/alpine-package-builder .
#
# USAGE:
#   docker run --rm -ti local/alpine-package-builder /bin/sh
#

# Set metadata
LABEL maintainer="Thomas Bendler <project@bendler-net.de>"
LABEL version="1.0"
LABEL description="Creates an Alpine container to build Alpine packages"

# Get build arguments
ARG ABUILD_GIT_NAME
ARG ABUILD_GIT_EMAIL
ARG ABUILD_GIT_SMTPSERVER
ARG ABUILD_GIT_SMTPUSER

# Set environment
ENV LANG en_US.UTF-8
ENV TERM xterm

# Install package build environment
RUN apk update && \
    apk upgrade && \
    apk add --no-cache alpine-sdk vim && \
    echo "" >> /etc/abuild.conf && \
    echo "PACKAGER=\"$ABUILD_GIT_NAME <$ABUILD_GIT_EMAIL>\"" >> /etc/abuild.conf && \
    echo "MAINTAINER=\"\$PACKAGER\"" >> /etc/abuild.conf && \
    mkdir -p /var/cache/distfiles && \
    chmod a+w /var/cache/distfiles && \
    chgrp abuild /var/cache/distfiles && \
    chmod g+w /var/cache/distfiles && \
    adduser -D -G abuild builder && \
    echo "builder ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Copy configuration files
COPY root /

# Switch user to builder and configure build environment
USER builder
RUN git config --global user.name "$ABUILD_GIT_NAME" && \
    git config --global user.email "$ABUILD_GIT_EMAIL" && \
    git config --global color.ui true && \
    git config --global core.editor vim && \
    git config --global core.pager less -FXRS && \
    git config --global sendemail.smtpserver "$ABUILD_GIT_SMTPSERVER" && \
    git config --global sendemail.smtpuser "$ABUILD_GIT_SMTPUSER" && \
    git config --global sendemail.smtpserverport 587 && \
    git config --global sendemail.smtpencryption tls && \
    git config --global sendemail.suppresscc all && \
    git config --global sendemail.to alpine-aports@lists.alpinelinux.org && \
    git clone git://git.alpinelinux.org/aports.git --depth 3

# Set workdir to builder
WORKDIR /home/builder
