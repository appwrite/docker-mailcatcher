# Base
FROM alpine:3.22 AS base
LABEL maintainer="team@appwrite.io"

ENV NODE_ENV=production
RUN apk --upgrade add --no-cache nodejs openssl

# Build
FROM base AS build

WORKDIR /root
RUN apk --upgrade add --no-cache curl git npm
RUN git clone --branch v2.2.1 https://github.com/maildev/maildev.git \
  && mkdir build \
  && cp maildev/package*.json build

WORKDIR /root/build
RUN npm install \
  && npm prune \
  && npm cache clean --force \
  && rm package*.json

# Prod
FROM base AS prod

RUN adduser node -D
USER node
WORKDIR /home/node

COPY --chown=node:node --from=build /root/maildev /home/node/maildev
COPY --chown=node:node --from=build /root/build/node_modules /home/node/maildev/node_modules

EXPOSE 1080 1025

ENTRYPOINT ["/home/node/maildev/bin/maildev"]
CMD ["--web", "1080", "--smtp", "1025"]
