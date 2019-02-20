#!/bin/sh

INSTALL_DIR=/build/pyre2/re2

mkdir /build/re2/build
cd /build/re2/build

cmake28 .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
    -DRE2_BUILD_TESTING=OFF \
    -DCMAKE_INSTALL_PREFIX="${INSTALL_DIR}"


make install -j $(nproc)

[ "${UID_GID}" ] && chown "${UID_GID}" -R . ${INSTALL_DIR}
