# Base
FROM alpine:3.12 as base
LABEL maintainer="team@appwrite.io"

ENV NODE_ENV production
RUN apk add --no-cache nodejs

# Build
FROM base as build

WORKDIR /root
RUN apk add --no-cache curl git npm
RUN git clone https://github.com/maildev/maildev.git \
  && mkdir build \
  && cp maildev/package*.json build

WORKDIR /root/build
RUN npm install \
  && npm prune \
  && npm cache clean --force \
  && rm package*.json

# Prod
FROM base as prod

RUN adduser node -D
USER node
WORKDIR /home/node

COPY --chown=node:node --from=build /root/maildev /home/node/maildev
COPY --chown=node:node --from=build /root/build/node_modules /home/node/maildev/node_modules

EXPOSE 1080 1025

ENTRYPOINT ["/home/node/maildev/bin/maildev"]
CMD ["--web", "1080", "--smtp", "1025"]
