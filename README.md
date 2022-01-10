# Grass SASS CSS preprocessor on Alpine (musl) in Docker

This is a Docker image containing a statically-linked binary of the [Grass Sass
CSS Preprocessor](https://github.com/connorskees/grass) at
`/usr/local/bin/grass`. Grass is like
[Dart-sass](https://github.com/sass/dart-sass), but written in
[Rust](https://www.rust-lang.org/).

## How to use it

Run

```
docker pull ghcr.io/kljensen/docker-grass-sass:latest
```

to pull down the image. Of course, you should use your preferred tag instead of
just `latest`. See the
[packages](https://github.com/kljensen/docker-grass-sass/pkgs/container/docker-grass-sass)
for available tags.

Then run

```
docker run ghcr.io/kljensen/docker-grass-sass:latest
```

to run the `grass` binary..

If you have a file like `foo.sass` in your current directory, you'd run
something like this to turn it into a CSS file

```
docker run -v "$(pwd)":/app ghcr.io/kljensen/docker-grass-sass:latest /app/foo.sass
```

## Why does this exist?

I failed to build a statically-linked version of
[Dart-sass](https://github.com/sass/dart-sass) on
[Alpine](https://www.alpinelinux.org/), which is my preferred Linux
distribution for [Docker](https://www.docker.com/) container images. (The
[debian:buster-slim](https://hub.docker.com/_/debian) image is 69.2MB whereas
[alpine:3.14](https://hub.docker.com/_/alpine) is 5.61MB. Maybe it doesn't
matter. I like the smaller ¯\_(ツ)_/¯.)

After running `strip` and `upx` on the `grass` binary, the image is just 750kB.
The only file in the image is `/usr/local/bin/grass`.

