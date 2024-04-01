FROM node:18 AS builder

RUN npm install -g @latitude-data/cli

COPY latitude.json .

RUN latitude telemetry --disable
RUN latitude setup

FROM builder AS runner

WORKDIR /usr/src/app

COPY . .

RUN latitude telemetry --disable
RUN latitude build

WORKDIR /usr/src/app/build

EXPOSE 3000

CMD ["node", "build"]

