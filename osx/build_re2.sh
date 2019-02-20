#!/bin/sh

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
INSTALL_DIR="${SCRIPTPATH}/../pyre2/re2"

cd "${SCRIPTPATH}/../re2"
patch -p1 < "${SCRIPTPATH}/CMakeLists.patch"

mkdir builddir
cd builddir

cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
    -DRE2_BUILD_TESTING=OFF \
    -DCMAKE_INSTALL_PREFIX="${INSTALL_DIR}"

make install
