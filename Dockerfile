FROM golang:1.13-alpine

# The following is a typical go install, which has been copied from
# the Dockerfile at minio/mc

ENV GOPATH /go
ENV CGO_ENABLED 0
ENV GO111MODULE on

RUN  \
     apk add --no-cache git && \
     git clone https://github.com/minio/mc && cd mc && \
     go install -v -ldflags "$(go run buildscripts/gen-ldflags.go)"

FROM alpine

# The following is a typical git install from within alpine,
# which has been copied from the Dockerfile at alpine/git

RUN apk --update add git less openssh && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

COPY --from=0 /go/bin/mc /usr/bin/mc

VOLUME /git
WORKDIR /git

# This environment variable should be set for this container to be useful
ENV MC_HOST_origin=https://Q3AM3UQ867SPQQA43P2F:zuf+tfteSlswRu7BJ86wekitnifILbZam1KYY3TG@play.min.io
# Note that the one provided in if provided in config, 

# The user should mount/copy the git's id_rsa here:
VOLUME /ssh_key/

COPY docker-run.sh /run.sh
COPY config_sample.sh /config

ENTRYPOINT [ "/run.sh" ]