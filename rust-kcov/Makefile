#
# rust-kcov/Makefile
#
# Dockerfile build script
#

DEBIAN_VERSION ?= buster

KCOV_VERSION ?= 38
KCOV_DOWNLOAD_URL ?= https://github.com/simonkagstrom/kcov/archive/${KCOV_VERSION}.tar.gz

DOCKER_TAG ?= ${RUST_VERSION}-${DEBIAN_VERSION}
REPO_NAME ?= akubera/rust-kcov

TEMPLATE_ENV = KCOV_URL=${KCOV_DOWNLOAD_URL} DEBIAN_VERSION=${DEBIAN_VERSION} ARCH=$(shell uname -m)

.PHONY: build upload clean Dockerfile

all: build

Dockerfile: Dockerfile-${DOCKER_TAG}
Dockerfile-${DOCKER_TAG}: Dockerfile.in kcov-rust
	${TEMPLATE_ENV} envsubst < $< > $@

build: Dockerfile-${DOCKER_TAG}
	docker build -f $< --rm --tag=${REPO_NAME}:${DOCKER_TAG} .

upload: build
	docker push ${REPO_NAME}:${DOCKER_TAG}

clean:
	rm -rf Dockerfile-*
