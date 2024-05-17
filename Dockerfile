
FROM node:18-slim AS base

RUN apt-get update && apt-get install -y curl
RUN npm install -g @latitude-data/cli@1.6.4

FROM base AS builder

WORKDIR /usr/src/app

COPY package.jso[n] .
COPY latitude.json .

RUN latitude setup --tty false

FROM builder AS runner

WORKDIR /usr/src/app

COPY --from=builder /usr/src/app/node_module[s] ./node_modules
COPY --from=builder /usr/src/app/.latitude ./
COPY --from=builder /usr/src/app/latitude.json ./latitude.json
COPY . .

RUN latitude build --tty false

WORKDIR /usr/src/app/build

EXPOSE 3000

CMD ["node", "build"]
