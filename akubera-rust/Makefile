#
# akubera-rust/Makefile
#
# Dockerfile build script
#

DEBIAN_VERSION ?= bookworm

DOCKER_TAG ?= ${RUST_VERSION}-${DEBIAN_VERSION}
RUST_TAG ?= ${RUST_VERSION}-${DEBIAN_VERSION}
REPO_NAME ?= akubera/rust

ifeq ($(strip $(RUST_VERSION)),)
$(error '$$RUST_VERSION is empty')
endif

.PHONY: all build upload clean Dockerfile

all: build

build: Dockerfile
	docker build -f $< --rm --tag=${REPO_NAME}:${DOCKER_TAG} --build-arg RUST_TAG=$(RUST_TAG) .

upload: build
	docker push ${REPO_NAME}:${DOCKER_TAG}

clean:
	rm -rf Dockerfile-*
