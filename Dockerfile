FROM golang:1.9-alpine3.6

ADD ./ /go/src/github.com/aramalipoor/oauth-proxy
WORKDIR  /go/src/github.com/aramalipoor/oauth-proxy

RUN apk update && apk add --no-cache ca-certificates

RUN go get -d -v
RUN go build -ldflags="-s -w"
RUN go install -v

EXPOSE 8080 4180

ENTRYPOINT [ "oauth-proxy" ]

USER 1001