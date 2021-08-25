===========
Docker-Rust
===========

My collection of rust-related docker images.

kcov
  Code-coverage report generating program. Works with ``cargo test`` output.

rust-kcov
  Build images based on official the Rust images with kcov compiled and installed

rust-codecov
  Build images off rust-kcov images with a script for uploading
  results to codecov


Dependencies
------------

These makefiles depend on the ``envsubst`` utility found in the ``gettext`` software suite.


Usage
-----

Make a rust-kcov image for a particular version of Rust by using ``make {RUST_VERSION}``


.. code:: bash

  # build docker image akubera/rust-kcov:1.42.0-buster
  $ make 1.42.0

  # build docker image akubera/rust-kcov:1.42.0-bullseye
  $ make 1.42.0 DEBIAN_VERSION=bullseye

  # explicit build rule
  $ make build-1.42.0

  # build and push docker image
  $ make upload-1.50.0
