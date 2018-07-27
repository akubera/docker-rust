#
# rust-kcov/Makefile
#
# Dockerfile build script
#

RUST_VERSION ?= nightly

# stable must look up the current value from web
ifeq (${RUST_VERSION},stable)
  RUST_ARCHIVE := $(shell curl -Ls https://static.rust-lang.org/dist/channel-rust-${RUST_VERSION} | grep x86_64-unknown-linux-gnu.tar.gz)
  RUST_FULL_NAME = $(subst .tar.gz,,${RUST_ARCHIVE})
else
  RUST_FULL_NAME = rust-${RUST_VERSION}-x86_64-unknown-linux-gnu
  RUST_ARCHIVE = ${RUST_FULL_NAME}.tar.gz
endif
RUST_DOWNLOAD_URL := https://static.rust-lang.org/dist/${RUST_ARCHIVE}


DOCKER_TAG ?= ${RUST_VERSION}
REPO_NAME ?= akubera/rust-kcov

TEMPLATE_ENV = RUST_DOWNLOAD_URL=${RUST_DOWNLOAD_URL} RUST_FULL_NAME=${RUST_FULL_NAME}

.PHONY: build upload clean 


all: build

Dockerfile-${RUST_VERSION}: Dockerfile.in kcov-rust
	${TEMPLATE_ENV} envsubst < $< > $@

build: Dockerfile-${RUST_VERSION}
	docker build -f $< --rm --tag=${REPO_NAME}:${DOCKER_TAG} .

upload: build
	docker push ${REPO_NAME}:${DOCKER_TAG}

clean:
	rm -rf Dockerfile-*

