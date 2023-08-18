#!/bin/bash

# set -x
set -eo pipefail

IMPORT_SH=${IMPORT_SH:-"import_ospkgs.sh"}
ARCH=$(uname -m)
OS_DISTRO=uniontech
VERSION_ID=20
BUILD_TOOLS="createrepo wget"
PACKAGES="unzip conntrack-tools container-selinux"

function require_arch(){
  case $ARCH in
  "amd64" | "x86_64" | "")
    echo "amd64"
    ;;
  "aarch64"| "arm64")
    echo "arm64"
    ;;
  esac
}

function check_dependencies() {
  if [ ! -f "${IMPORT_SH}" ]; then
    echo "${IMPORT_SH} does not exist."
  fi
}

check_dependencies

mkdir -p /${OS_DISTRO}/${VERSION_ID}/os
pushd /${OS_DISTRO}/${VERSION_ID}/os
dnf install -y ${BUILD_TOOLS}
# why use `--alldeps` ?
# Because it is not certain that the host running the build has the package installed, 
# if the package is installed, the downloaded offline package may be missing the underlying dependencies.
for item in ${PACKAGES}; do dnf download --resolve --alldeps --destdir=${ARCH} ${item}; done
createrepo -d ${ARCH}
popd

mkdir os-pkgs/ resources/
mv /${OS_DISTRO} resources/${OS_DISTRO}
tar -I pigz -cf os-pkgs/os-pkgs-$(require_arch).tar.gz resources --remove-files
sha256sum os-pkgs/os-pkgs-$(require_arch).tar.gz > os-pkgs/os-pkgs.sha256sum.txt

cp ${IMPORT_SH} os-pkgs/import_ospkgs.sh
tar -I pigz -cf os-pkgs-${OS_DISTRO}-${VERSION_ID}.tar.gz os-pkgs/ --remove-files
