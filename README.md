# Grass SASS CSS preprocessor on Alpine (musl) in Docker

This is a Docker image containing a statically-linked binary of the [Grass Sass
CSS Preprocessor](https://github.com/connorskees/grass) at
`/usr/local/bin/grass`. Grass is like
[Dart-sass](https://github.com/sass/dart-sass), but written in
[Rust](https://www.rust-lang.org/).

## Using

Run

```
docker pull ghcr.io/kljensen/docker-grass-sass:release
```

## Why

I failed to build a statically-linked version of
[Dart-sass](https://github.com/sass/dart-sass) on
[Alpine](https://www.alpinelinux.org/), which is my preferred Linux
distribution for [Docker](https://www.docker.com/) container images. (The
[debian:buster-slim](https://hub.docker.com/_/debian) image is 69.2MB whereas
[alpine:3.14](https://hub.docker.com/_/alpine) is 5.61MB. Maybe it doesn't
matter. I like the smaller ¯\_(ツ)_/¯.)

After running `strip` and `upx` on the `grass` binary, the image is just 750kB.
The only file in the image is `/usr/local/bin/grass`.

