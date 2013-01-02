#!/bin/bash
# installs packges found in ~/aur

PKG=~/myaur/dev

CWD=`pwd`
for p in instant fiat ufc ufl viper ffc dolfin; do
    echo "Building $p...."
    cd $PKG/$p
    makepkg -sfL || exit 1
    cd $CWD
done
