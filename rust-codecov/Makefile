#
# rust-codecov
#

DEBIAN_VERSION ?= bullseye
DOCKER_TAG ?= ${RUST_VERSION}-${DEBIAN_VERSION}
DOCKER_REPO ?= akubera/rust-codecov

.PHONY: build upload clean Dockerfile


Dockerfile: Dockerfile-${DOCKER_TAG}
Dockerfile-${DOCKER_TAG}: Dockerfile.in
	sed "s/DOCKER_TAG/${DOCKER_TAG}/g" $< > $@

build: Dockerfile-${DOCKER_TAG}
	docker build --rm -f $< --tag ${DOCKER_REPO}:${DOCKER_TAG} .

upload: build
	docker push ${DOCKER_REPO}:${DOCKER_TAG}

clean:
	rm -rf Dockerfile-*
