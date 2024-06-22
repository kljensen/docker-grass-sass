ARG GRASS_VERSION=0.13.2
FROM rust:1.79-alpine3.19@sha256:b5d5bb4fa17a7fd926f64937ea0f7f57dcabf73de62f4fa89fd83f4758cdc904 AS build
ARG GRASS_VERSION
RUN \
    apk add --no-cache musl-dev curl upx && \
    curl -LO https://github.com/connorskees/grass/archive/refs/tags/${GRASS_VERSION}.zip  && \
    unzip $GRASS_VERSION.zip && \
    cd grass-$GRASS_VERSION && \
    cargo build --release --bin grass  && \
    strip target/release/grass && \
    upx --best --lzma target/release/grass
FROM scratch
ARG GRASS_VERSION
COPY --from=build /grass-${GRASS_VERSION}/target/release/grass /usr/local/bin/grass
ENTRYPOINT ["/usr/local/bin/grass"]
