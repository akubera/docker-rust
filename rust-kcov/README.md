rust-kcov
=========

Docker image recipe for rust with code coverage support via kcov.

[DockerHub](https://hub.docker.com/r/akubera/rust-kcov)

This includes a helper script `kcov-rust` which takes the output
of `cargo test` and creates coverage reports in a `target/cov`
directory; output includes html pages with annotated source code.


Docker image will be built on offical `rust:{RUST_VERISON}-{DEBIAN_VERSION}`.


### Examples

```bash
make RUST_VERSION=1.54.0 DEBIAN_VERSION=buster
make RUST_VERSION=1.50.0 DEBIAN_VERSION=bullseye ARCH=aarm64

# only build Dockerfile (output will be Dockerfile-{RUST}-{DEBIAN})
make Dockerfile RUST_VERSION=1.54.0 DEBIAN_VERSION=buster
```
