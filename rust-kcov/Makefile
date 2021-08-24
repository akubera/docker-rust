#
# rust-kcov/Makefile
#
# Dockerfile build script
#

DEBIAN_VERSION ?= buster

KCOV_VERSION ?= 38
KCOV_DOWNLOAD_URL ?= https://github.com/simonkagstrom/kcov/archive/${KCOV_VERSION}.tar.gz
RUST_VERSION ?= nightly

DOCKER_TAG ?= ${RUST_VERSION}-${DEBIAN_VERSION}
REPO_NAME ?= akubera/rust-kcov

TEMPLATE_ENV = KCOV_URL=${KCOV_DOWNLOAD_URL} DEBIAN_VERSION=${DEBIAN_VERSION}

.PHONY: build upload clean


all: build


build-standard:
	RUST_VERSION=stable $(MAKE) build
	RUST_VERSION=beta make build
	RUST_VERSION=nightly make build

upload-standard:
	RUST_VERSION=stable make upload
	RUST_VERSION=beta make upload
	RUST_VERSION=nightly make upload

Dockerfile-${DOCKER_TAG}: Dockerfile.in kcov-rust
	${TEMPLATE_ENV} envsubst < $< > $@

build: Dockerfile-${DOCKER_TAG}
	docker build -f $< --rm --tag=${REPO_NAME}:${DOCKER_TAG} .

upload: build
	docker push ${REPO_NAME}:${DOCKER_TAG}

clean:
	rm -rf Dockerfile-*
