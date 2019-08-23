
FROM golang:1.12
RUN go get -u -v github.com/go-delve/delve/cmd/dlv
EXPOSE 2345

RUN mkdir -p $GOPATH/src/play-dock
WORKDIR $GOPATH/src/play-dock
COPY . .

EXPOSE 8080

CMD ["dlv", "debug", "--headless", "--listen=:2345", "--log", "--api-version", "2"]
