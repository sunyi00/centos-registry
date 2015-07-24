FROM sunyi00/centos-golang:1.0.0

RUN yum -y install librados2-devel apache2-utils \
    && yum -y clean all

ENV DISTRIBUTION_DIR /go/src/github.com/docker/distribution
ENV GOPATH $DISTRIBUTION_DIR/Godeps/_workspace:$GOPATH
ENV DOCKER_BUILDTAGS include_rados

WORKDIR $DISTRIBUTION_DIR
COPY . $DISTRIBUTION_DIR
RUN make PREFIX=/go clean binaries
