#
# kcov/Makefile
#
# Dockerfile build script
#

KCOV_VERSION ?= 36
KCOV_DOWNLOAD_URL=https://github.com/simonkagstrom/kcov/archive/v${KCOV_VERSION}.tar.gz 
KCOV_BUILD_DIR = kcov-${KCOV_VERSION}

DOCKER_TAG ?= v${KCOV_VERSION}

REPO_NAME ?= akubera/kcov


TEMPLATE_ENV = KCOV_BUILD_DIR=${KCOV_BUILD_DIR} KCOV_VERSION=${KCOV_VERSION} KCOV_DOWNLOAD_URL=${KCOV_DOWNLOAD_URL}


.PHONY: build upload clean Dockerfile


Dockerfile: Dockerfile.in
	${TEMPLATE_ENV} envsubst < $< > $@

build: Dockerfile
	docker build --rm --tag=${REPO_NAME}:${DOCKER_TAG} .

upload: build
	docker push ${REPO_NAME}:${DOCKER_TAG}

clean:
	rm -rf Dockerfile

