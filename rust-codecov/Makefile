#
# rust-codecov
#


RUST_VERSION ?= nightly
DOCKER_TAG ?= ${RUST_VERSION}
DOCKER_REPO ?= akubera/rustc-codecov

.PHONY: build clean

Dockerfile-${RUST_VERSION}: Dockerfile
	sed "s/RUST-VERSION/${RUST_VERSION}/g" $< > $@

build: Dockerfile-${RUST_VERSION}
	docker build --rm --tag ${DOCKER_REPO}:${DOCKER_TAG} -f $<

clean:
	rm -rf Dockerfile-*

 
