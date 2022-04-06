FROM node:16

EXPOSE 5000

WORKDIR /usr/src/app

RUN npm install -g serve

COPY package*.json ./

RUN npm install

COPY . .

ENV REACT_APP_BACKEND_URL=http://localhost/api

RUN npm run build

RUN useradd -m appuser
USER appuser

CMD ["serve", "-s", "-l", "5000", "build"]
