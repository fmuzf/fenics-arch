#!/usr/bin/env bash
# installs pacakges found in ~/aur
set -o errexit

#PKG=~/aur/packages/fenics
PKG=~/myaur/dev

CWD=`pwd`

source ~/bin/pacman-lib.sh

# instant fiat ufc ufl viper ffc dolfin
#pkgs="instant fiat ufc ufl viper ffc"
pkgs="instant fiat ufc ufl viper ffc-bzr dolfin-bzr"
for p in $pkgs; do
    echo "Building $p...."
    cd $PKG/$p
    makepkg -sfL

    cd $PKG/$p
    PKGVER=$(grep "^pkgver=" PKGBUILD)
    PKGREL=$(grep "^pkgrel=" PKGBUILD)
    pf="$p-${PKGVER##pkgver=}-${PKGREL##pkgrel=}-any.pkg.tar.xz"

    echo "Adding package $p"
    #pf=`ls $p*.xz`
    addPkgDev ${pf}
    cd $CWD

    echo updating pacman
    sudo pacman -Sy
done

for p in $pkgs; do
    echo installing package $p
    cd $PKG/$p
    sudo pacman --noconfirm -S $p
    cd $CWD
done

# pkg/usr/lib/python3.1/site-packages/ufc/__init__.py
# pkg/usr/lib/python3.1/site-packages/ufc/ufc.py
# pkg/usr/lib/python3.1/site-packages/ufc_utils/finite_element.py
# pkg/usr/lib/python3.1/site-packages/ufc_utils/integrals.py
# pkg/usr/lib/python3.1/site-packages/ufc_utils/build.py
# pkg/usr/lib/python3.1/site-packages/ufc_utils/__init__.py
# pkg/usr/lib/python3.1/site-packages/ufc_utils/dof_map.py
# pkg/usr/lib/python3.1/site-packages/ufc_utils/form.py
# pkg/usr/lib/python3.1/site-packages/ufc_utils/function.py
