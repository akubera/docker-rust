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

export DEBIAN_VERSION=bullseye
export KCOV_VERSION=42

MAKE_KCOV_BUILD_CMD = '$(MAKE) -C rust-kcov build'
MAKE_KCOV_UPLOAD_CMD = '$(MAKE) -C rust-kcov upload'

MAKE_GRCOV_BUILD_CMD = '$(MAKE) -C rust-grcov build'
MAKE_GRCOV_UPLOAD_CMD = '$(MAKE) -C rust-grcov upload'

MAKE_CODECOV_BUILD_CMD = '$(MAKE) -C rust-codecov build'
MAKE_CODECOV_UPLOAD_CMD = '$(MAKE) -C rust-codecov upload'

MAKE_AKUBERA_BUILD_CMD = '$(MAKE) -C akubera-rust build'
MAKE_AKUBERA_UPLOAD_CMD = '$(MAKE) -C akubera-rust upload'

.PHONY: all clean build-% upload-% 1.%

DEFAULT_TARGETS=1.43.2 1.54.0 1.75.0

all: $(DEFAULT_TARGETS)


1.%: build-1.%;

build-1.34.2: DEBIAN_VERSION=stretch
build-%:
	RUST_VERSION=`echo $@ | cut -d- -f 2` sh -c $(MAKE_KCOV_BUILD_CMD)
	RUST_VERSION=`echo $@ | cut -d- -f 2` sh -c $(MAKE_GRCOV_BUILD_CMD)
	RUST_VERSION=`echo $@ | cut -d- -f 2` sh -c $(MAKE_CODECOV_BUILD_CMD)
	RUST_VERSION=`echo $@ | cut -d- -f 2` sh -c $(MAKE_AKUBERA_BUILD_CMD)

upload: $(addprefix upload-,$(DEFAULT_TARGETS))
upload-1.34.2: DEBIAN_VERSION=stretch
upload-%: build-%
	RUST_VERSION=`echo $@ | cut -d- -f 2` sh -c $(MAKE_KCOV_UPLOAD_CMD)
	RUST_VERSION=`echo $@ | cut -d- -f 2` sh -c $(MAKE_GRCOV_UPLOAD_CMD)
	RUST_VERSION=`echo $@ | cut -d- -f 2` sh -c $(MAKE_CODECOV_UPLOAD_CMD)
	RUST_VERSION=`echo $@ | cut -d- -f 2` sh -c $(MAKE_AKUBERA_UPLOAD_CMD)


clean:
	$(MAKE) -C kcov clean
	$(MAKE) -C rust-kcov clean
	$(MAKE) -C rust-codecov clean
