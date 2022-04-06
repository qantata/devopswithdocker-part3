FROM ubuntu:18.04

EXPOSE 5000

WORKDIR /usr/src/app

COPY . .

ENV REACT_APP_BACKEND_URL=http://localhost/api

RUN apt-get update && apt-get install -y \
  curl && \
  curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - && \
  apt-get install -y nodejs && \
  npm install -g serve && \
  npm install && \
  npm run build && \
  npm prune --production && \
  apt-get purge -y --auto-remove curl && \
  rm -rf /var/lib/apt/lists/* && \
  useradd -m appuser

USER appuser

CMD ["serve", "-s", "-l", "5000", "build"]
