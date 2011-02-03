#!/bin/bash
# installs pacakges found in ~/aur

PKG=~/aur/packages/fenics

CWD=`pwd`
for p in instant fiat ufc ufl viper ffc dolfin; do
echo makepkg --source $p
cd $PKG/$p
#pf=`ls $p*.xz`
makepkg --source
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
