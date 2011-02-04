#!/bin/bash
# installs pacakges found in ~/aur

PKG=~/aur/packages/fenics

CWD=`pwd`
for p in instant fiat ufc ufl viper ffc dolfin; do
echo makepkg -sf $p
cd $PKG/$p
#pf=`ls $p*.xz`
makepkg -fs
cd $CWD
done
