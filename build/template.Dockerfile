FROM        golang:latest

MAINTAINER  tdeheurles@gmail.com

COPY        ws-backend.go   /go/src/ws-backend/

WORKDIR     /go/src/ws-backend/
RUN         go get code.google.com/p/go.net/websocket
RUN         go install

EXPOSE      __SERVICEPORT__

CMD         ws-backend
