FROM golang:1.17-alpine as builder

RUN apk add --no-cache make gcc musl-dev linux-headers git bash

RUN git clone https://github.com/tharsis/evmos.git
RUN cd evmos && git checkout tags/v0.2.0 -b dood && make install

FROM alpine:latest

RUN apk add --no-cache ca-certificates curl jq tini git
COPY --from=builder /go/bin/evmosd /usr/local/bin/
COPY docker-entrypoint.sh /root/entrypoint.sh
RUN ["chmod", "+x", "/root/entrypoint.sh"]

EXPOSE 26657
ENTRYPOINT ["/root/entrypoint.sh"]
