################################################################################
#      This file is part of LibreELEC - https://libreelec.tv
#      Copyright (C) 2016 Team LibreELEC
#
#  LibreELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  LibreELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with LibreELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="libretro-4do"
PKG_VERSION="b8b029b"
PKG_SHA256="385576b8c3cdc907fd1a9b6a9223bbeb2f67d506d45d9ed72baf4b3c94f0b7e0"
PKG_ARCH="any"
PKG_LICENSE="LGPL"
PKG_SITE="https://github.com/libretro/4do-libretro"
PKG_URL="https://github.com/libretro/4do-libretro/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="4do-libretro-$PKG_VERSION*"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="emulation"
PKG_SHORTDESC="Port of 4DO/libfreedo to libretro."
PKG_LONGDESC="Port of 4DO/libfreedo to libretro."

PKG_IS_ADDON="no"
PKG_USE_CMAKE="no"
PKG_AUTORECONF="no"

PKG_LIBNAME="4do_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"
PKG_LIBVAR="4DO_LIB"

makeinstall_target() {
  mkdir -p $SYSROOT_PREFIX/usr/lib/cmake/$PKG_NAME
  cp $PKG_LIBPATH $SYSROOT_PREFIX/usr/lib/$PKG_LIBNAME
  echo "set($PKG_LIBVAR $SYSROOT_PREFIX/usr/lib/$PKG_LIBNAME)" > $SYSROOT_PREFIX/usr/lib/cmake/$PKG_NAME/$PKG_NAME-config.cmake
}
