FROM golang:1.17

WORKDIR /usr/src/app

COPY . .

RUN go build .

CMD ./axii
