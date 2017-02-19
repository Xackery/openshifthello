FROM golang:1.6.2
MAINTAINER Xackery <xackery@gmail.com>

ENV GOPATH /go
ENV USER root

COPY . /go/src/github.com/xackery/openshifthello

RUN cd /go/src/github.com/xackery/openshifthello \
	&& go get -d -v \
	&& go install \
	&& go test github.com/xackery/openshifthello...
	&& mkdir -p /go/src/github.com/xackery/openshifthello
WORKDIR /go/src/github.com/xackery/openshifthello

COPY . /go/src/github.com/xackery/openshifthello
RUN go-wrapper download && go-wrapper install

CMD ["go-wrapper", "run"]