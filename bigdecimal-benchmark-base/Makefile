#
# bigdecimal/Makefile
#
# Dockerfile build script
#

DEBIAN_VERSION ?= bullseye

DOCKER_TAG ?= ${RUST_VERSION}-${DEBIAN_VERSION}
REPO_NAME ?= akubera/bigdecimal-test-data

TEMPLATE_ENV = DEBIAN_VERSION=${DEBIAN_VERSION} ARCH=$(shell uname -m)

BENCHMARK_FILES =\
  random-bigdecimals-a329e61834832d89593b29f12510bdc8.txt \
  random-bigdecimals-4be58192272b15fc67573b39910837d0.txt \
  random-bigdecimals-9a08ddaa6ce6693cdd7b8a524e088bd0.txt \
  random-bigdecimals-1f633481a742923ab65855c90157bbf7.txt 


.PHONY: build upload clean Dockerfile

all: build

Dockerfile: Dockerfile-${DOCKER_TAG}
Dockerfile-${DOCKER_TAG}: Dockerfile.in benchmark-data.tgz
	${TEMPLATE_ENV} envsubst < $< > $@

build: Dockerfile-${DOCKER_TAG}
	#docker buildx build --progress=plain -f $< --rm --tag=${REPO_NAME}:${DOCKER_TAG} . --load
	docker build -f $< --rm --tag=${REPO_NAME}:${DOCKER_TAG} .

upload: build
	docker push ${REPO_NAME}:${DOCKER_TAG}

benchmark-data.tgz: $(BENCHMARK_FILES)
	tar czf $@ $^

random-bigdecimals-%.txt:
	wget https://gitlab.com/akubera/bigdecimal-rs/-/raw/data-files/random-test-inputs/$@

clean:
	rm -rf Dockerfile-*
