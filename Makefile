
all: build

MAKE_BUILD_CMD = 'make -C rust-kcov build && make -C rust-codecov build'
MAKE_UPLOAD_CMD = 'make -C rust-kcov upload && make -C rust-codecov upload'


build:
	RUST_VERSION=stable sh -c $(MAKE_BUILD_CMD)
	RUST_VERSION=beta sh -c $(MAKE_BUILD_CMD)
	RUST_VERSION=nightly sh -c $(MAKE_BUILD_CMD)

upload:
	RUST_VERSION=stable sh -c $(MAKE_UPLOAD_CMD)
	RUST_VERSION=beta sh -c $(MAKE_UPLOAD_CMD)
	RUST_VERSION=nightly sh -c $(MAKE_UPLOAD_CMD)

