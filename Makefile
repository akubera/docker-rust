#
# Makefile
#
# To use: 
#
# Upload some version and call it stable, then update beta and nightly
#
# `make upload.stable-{VERSION}`
# `make upload`
# 
#  make upload.stable-1.33.0
#  make upload
#


all: build

MAKE_BUILD_CMD = 'make -C rust-kcov build && make -C rust-codecov build'
MAKE_UPLOAD_CMD = 'make -C rust-kcov upload && make -C rust-codecov upload'


full-%: upload.stable-% upload

upload.stable-%: build.stable-% upload-% upload-stable

build.stable-%: build-%
	docker tag akubera/rust-kcov:$(subst build-,,$<) akubera/rust-kcov:stable 

build-%:
	RUST_VERSION=`echo $@ | cut -d- -f 2` sh -c $(MAKE_BUILD_CMD)

upload-%: build-%
	RUST_VERSION=`echo $@ | cut -d- -f 2` sh -c $(MAKE_UPLOAD_CMD)


build:
	#RUST_VERSION=stable sh -c $(MAKE_BUILD_CMD)
	RUST_VERSION=beta sh -c $(MAKE_BUILD_CMD)
	RUST_VERSION=nightly sh -c $(MAKE_BUILD_CMD)


upload:
	#RUST_VERSION=stable sh -c $(MAKE_UPLOAD_CMD)
	RUST_VERSION=beta sh -c $(MAKE_UPLOAD_CMD)
	RUST_VERSION=nightly sh -c $(MAKE_UPLOAD_CMD)


clear-cache:
	docker rmi akubera/rust-kcov:stable akubera/rust-codecov:stable
	docker rmi akubera/rust-kcov:beta akubera/rust-codecov:beta
	docker rmi akubera/rust-kcov:nightly akubera/rust-codecov:nightly


clean: clear-cache

