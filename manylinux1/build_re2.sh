#!/bin/sh

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

if [ "x${RE2_ARCH}" = x"i686" ]; then
    IMAGE=quay.io/pypa/manylinux1_i686
else
    IMAGE=quay.io/pypa/manylinux1_x86_64
fi

cd "${SCRIPTPATH}/../re2"
patch -p1 < "${SCRIPTPATH}/CMakeLists.patch"

cd "${SCRIPTPATH}/.."

docker run --rm \
    -v $(pwd):/build \
    -e UID_GID="$(id -u):$(id -g)" \
    "${IMAGE}" \
    /build/manylinux1/inside_container.sh
