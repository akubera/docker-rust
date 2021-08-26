#
# Makefile
#
# To use, call `make {VERSION}` or `make build-{VERSION}` to enter
# rust-kcov & rust-codecov, create the Dockerfiles and call `docker build`
#
# call `make upload-{VERSION} to docker-push the version to ${REPO_NAME}
#
# examples:
#
#  make build-1.33.0
#  make 1.55.0 DEBIAN_VERSION=bullseye
#  make upload-1.54.0
#

export DEBIAN_VERSION=buster
export KCOV_VERSION=38

MAKE_BUILD_CMD = '$(MAKE) -C rust-kcov build && $(MAKE) -C rust-codecov build'
MAKE_UPLOAD_CMD = '$(MAKE) -C rust-kcov upload && $(MAKE) -C rust-codecov upload'


.PHONY: all clean build-% upload-% 1.%

DEFAULT_TARGETS=1.34.2 1.36.0 1.42.0 1.54.0

all: $(DEFAULT_TARGETS)


1.%: build-1.%;

build-1.34.2: DEBIAN_VERSION=stretch
build-%:
	RUST_VERSION=`echo $@ | cut -d- -f 2` sh -c $(MAKE_BUILD_CMD)

upload: $(addprefix upload-,$(DEFAULT_TARGETS))
upload-1.34.2: DEBIAN_VERSION=stretch
upload-%: build-%
	RUST_VERSION=`echo $@ | cut -d- -f 2` sh -c $(MAKE_UPLOAD_CMD)


clean:
	$(MAKE) -C kcov clean
	$(MAKE) -C rust-kcov clean
	$(MAKE) -C rust-codecov clean
