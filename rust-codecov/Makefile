#
# rust-codecov
#


RUST_VERSION ?= nightly
DOCKER_TAG ?= ${RUST_VERSION}
DOCKER_REPO ?= akubera/rust-codecov

.PHONY: build upload clean


Dockerfile-${RUST_VERSION}: Dockerfile
	sed "s/RUST-VERSION/${RUST_VERSION}/g" $< > $@

build: Dockerfile-${RUST_VERSION}
	docker build --rm -f $< --tag ${DOCKER_REPO}:${DOCKER_TAG} .

upload: build
	docker push ${DOCKER_REPO}:${DOCKER_TAG}

clean:
	rm -rf Dockerfile-*

 
