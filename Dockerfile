FROM golang:latest
RUN go get github.com/eclipse/paho.mqtt.golang
RUN go get github.com/gorilla/websocket
RUN go get golang.org/x/net/proxy
