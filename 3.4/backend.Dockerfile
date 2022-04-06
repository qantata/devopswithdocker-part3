FROM golang:alpine as build

WORKDIR /app

COPY . .

RUN go build -o server

FROM alpine

WORKDIR /app

RUN apk update && \
  apk add ca-certificates && \
  rm -rf /var/cache/apk/* && \
  adduser -S appuser

COPY --from=build /app/server /app
USER appuser

ENV REQUEST_ORIGIN=http://localhost
EXPOSE 8080

CMD ./server
