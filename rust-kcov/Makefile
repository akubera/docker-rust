#
# rust-kcov/Makefile
#
# Dockerfile build script
#

DEBIAN_VERSION ?= bookworm

KCOV_VERSION ?= 42
KCOV_DOWNLOAD_URL ?= https://github.com/simonkagstrom/kcov/archive/v${KCOV_VERSION}.tar.gz

DOCKER_TAG ?= ${RUST_VERSION}-${DEBIAN_VERSION}
DEBIAN_TAG ?= ${DEBIAN_VERSION}-slim
RUST_TAG ?= ${RUST_VERSION}-slim-${DEBIAN_VERSION}
REPO_NAME ?= akubera/rust-kcov

TEMPLATE_ENV = KCOV_URL=$(KCOV_DOWNLOAD_URL) DEBIAN_TAG=$(DEBIAN_TAG) RUST_TAG=$(RUST_TAG) ARCH=$(shell uname -m)

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
