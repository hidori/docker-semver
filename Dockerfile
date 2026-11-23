FROM alpine:3.24

RUN apk add --no-cache libstdc++ libatomic \
    && NODE_VERSION=$(wget -qO- https://nodejs.org/dist/index.tab | awk 'NR > 1 && $10 != "-" { print $1; exit }') \
    && wget -qO- "https://nodejs.org/dist/${NODE_VERSION}/node-${NODE_VERSION}-linux-x64-musl.tar.xz" | tar -xJ -C /usr/local --strip-components=1 --no-same-owner

WORKDIR /app

RUN npm i semver@latest
RUN npm audit fix

ENTRYPOINT [ "/app/node_modules/.bin/semver" ]
