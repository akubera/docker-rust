#
# rust-kcov/Dockerfile
#
# Debian-based container with rustc/cargo and 'kcov' - a
# coverage program which can analyze the code coverage of
# rust tests.
#

FROM akubera/kcov:latest


#===========================#
# Download and Install Rust #
#===========================#
RUN curl -Ls $RUST_DOWNLOAD_URL | tar xz -C /tmp \
 && cd /tmp/$RUST_FULL_NAME \
 && ./install.sh --without=rust-docs \
 && cd - \
 && rm -fr /tmp/$RUST_FULL_NAME


#======================#
# Finalize Environment #
#======================#
WORKDIR /home
