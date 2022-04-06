FROM node:16 as build

WORKDIR /app

COPY package* ./

RUN npm install

COPY . .

ENV REACT_APP_BACKEND_URL=http://localhost/api

RUN npm run build

FROM alpine

WORKDIR /app

RUN apk update && \
  apk add thttpd && \
  rm -rf /var/cache/apk/* && \
  adduser -D appuser

COPY --from=build /app/build /app/build

USER appuser

EXPOSE 5000

CMD ["thttpd", "-D", "-h", "0.0.0.0", "-p", "5000", "-d", "/app/build", "-u", "static", "-l", "-", "-M", "60"]
