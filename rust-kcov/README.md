rust-kcov
=========

Docker image recipe for rust with code coverage support via kcov.

[DockerHub](https://hub.docker.com/r/akubera/rust-kcov)

This includes a helper script `kcov-rust` which takes the output
of `cargo test` and creates coverage reports in a `target/cov`
directory; output includes html pages with annotated source code.

