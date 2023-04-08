#
# rust-grcov/Makefile
#
# Dockerfile build script
#

DEBIAN_VERSION ?= bullseye

DOCKER_TAG ?= ${RUST_VERSION}-${DEBIAN_VERSION}
REPO_NAME ?= akubera/rust-grcov

TEMPLATE_ENV = DEBIAN_VERSION=${DEBIAN_VERSION} ARCH=$(shell uname -m)

.PHONY: build upload clean Dockerfile

all: build

Dockerfile: Dockerfile-${DOCKER_TAG}
Dockerfile-${DOCKER_TAG}: Dockerfile.in
	${TEMPLATE_ENV} envsubst < $< > $@

build: Dockerfile-${DOCKER_TAG}
	docker buildx build -f $< --rm --tag=${REPO_NAME}:${DOCKER_TAG} . --load

upload: build
	docker push ${REPO_NAME}:${DOCKER_TAG}

clean:
	rm -rf Dockerfile-*
