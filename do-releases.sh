#!/usr/bin/env bash
#
# Push container updates for given rust version
#

set -e

DEFAULT_RUST_VERSION=1.75.0
read -r -p "Rust Version ($DEFAULT_RUST_VERSION) " RUST_VERSION_INPUT
RUST_VERSION="${RUST_VERSION_INPUT:-$DEFAULT_RUST_VERSION}"

echo "BUILDING $RUST_VERSION"

# enough time to ctrl-c?
sleep 2

make $RUST_VERSION

#
# akubera/rust
#
DEBIAN_VERSION=bullseye
make -C akubera-rust upload RUST_VERSION="$RUST_VERSION" DEBIAN_VERSION="$DEBIAN_VERSION"
docker tag akubera/rust:"$RUST_VERSION-$DEBIAN_VERSION" akubera/rust:stable
docker push akubera/rust:stable

PROJECTS=(rust-kcov rust-grcov rust-codecov)
DEBIAN_VERSIONS=(bookworm)

#
# akubera/rust
#
for DEBIAN_VERSION in "${DEBIAN_VERSIONS[@]}"
  do

  for PROJECT in "${PROJECTS[@]}"
    do
    make -C "$PROJECT" build RUST_VERSION="$RUST_VERSION" DEBIAN_VERSION="$DEBIAN_VERSION"
    done

  for PROJECT in "${PROJECTS[@]}"
    do
    make -C "$PROJECT" upload RUST_VERSION="$RUST_VERSION" DEBIAN_VERSION="$DEBIAN_VERSION"
    done

  done
