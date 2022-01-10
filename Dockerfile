FROM rust:1.57.0-alpine3.14 AS build
RUN \
    apk add --no-cache musl-dev curl \
    curl -LO https://github.com/connorskees/grass/archive/dd92ebf39b16a89d757f473927e59c68b178e076.zip \
    unzip dd92ebf39b16a89d757f473927e59c68b178e076.zip \
    cd grass-dd92ebf39b16a89d757f473927e59c68b178e076 \
    cargo build --release --bin grass 
FROM scratch
COPY --from=build /grass-dd92ebf39b16a89d757f473927e59c68b178e076/target/release/grass /usr/local/bin/grass
ENTRYPOINT ["/usr/local/bin/grass"]
