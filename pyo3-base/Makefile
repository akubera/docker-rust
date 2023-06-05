#
# pyo3-base/Makefile
#
# Dockerfile build script
#

DEBIAN_VERSION ?= bullseye

DOCKER_TAG ?= ${RUST_VERSION}-${DEBIAN_VERSION}
REPO_NAME ?= akubera/rust-pyo3-base

TEMPLATE_ENV = DEBIAN_VERSION=${DEBIAN_VERSION} ARCH=$(shell uname -m)

.PHONY: build upload clean Dockerfile

ifeq ($(origin RUST_VERSION),undefined)
$(error Missing RUST_VERSION environment variable)
endif

all: build

Dockerfile: Dockerfile-${DOCKER_TAG}
Dockerfile-${DOCKER_TAG}: Dockerfile.in
	${TEMPLATE_ENV} envsubst < $< > $@

build: Dockerfile-${DOCKER_TAG}
	docker buildx build --progress=plain -f $< --rm --tag=${REPO_NAME}:${DOCKER_TAG} . --load

upload: build
	docker push ${REPO_NAME}:${DOCKER_TAG}

clean:
	rm -rf Dockerfile-*
