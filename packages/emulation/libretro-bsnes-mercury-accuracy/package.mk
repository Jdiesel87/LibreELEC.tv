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

PKG_NAME="libretro-bsnes-mercury-accuracy"
PKG_VERSION="9061b90"
PKG_SHA256="b2fb674b5fbef83dea72fdd2ee8be255a2e1cb0b73c16d77a2151474d1744454"
PKG_ARCH="any"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/bsnes-mercury"
PKG_URL="https://github.com/libretro/bsnes-mercury/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="bsnes-mercury-$PKG_VERSION*"
PKG_DEPENDS_TARGET="toolchain kodi-platform"
PKG_SECTION="emulation"
PKG_SHORTDESC="game.libretro.beetle-bsnes-accuracy: Beetle bSNES for Kodi"
PKG_LONGDESC="game.libretro.beetle-bsnes-accuracy: Beetle bSNES for Kodi"
PKG_AUTORECONF="no"
PKG_IS_ADDON="no"
PKG_USE_CMAKE="no"

PKG_LIBNAME="bsnes_mercury_accuracy_libretro.so"
PKG_LIBPATH="out/$PKG_LIBNAME"
PKG_LIBVAR="BSNES-MERCURY-ACCURACY_LIB"

make_target() {
  make profile=accuracy
}

makeinstall_target() {
  mkdir -p $SYSROOT_PREFIX/usr/lib/cmake/$PKG_NAME
  cp $PKG_LIBPATH $SYSROOT_PREFIX/usr/lib/$PKG_LIBNAME
  echo "set($PKG_LIBVAR $SYSROOT_PREFIX/usr/lib/$PKG_LIBNAME)" > $SYSROOT_PREFIX/usr/lib/cmake/$PKG_NAME/$PKG_NAME-config.cmake
}

