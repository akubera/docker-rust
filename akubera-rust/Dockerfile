#
# Dockerfile - akubera/rust
#
# Debian-based container with rust/cargo/clippy
#

ARG RUST_TAG

FROM rust:${RUST_TAG} AS builder


RUN apt-get update -qy \
 && apt-get install -qy --no-install-recommends \
        binutils-dev cmake

RUN cargo install cargo-semver-checks

FROM rust:${RUST_TAG}

RUN rustup component add clippy
COPY --from=builder /usr/local/cargo/bin/cargo-semver-checks /usr/local/cargo/bin/cargo-semver-checks

WORKDIR /home
