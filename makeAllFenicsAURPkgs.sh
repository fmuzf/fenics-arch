#!/usr/bin/env bash

# installs packages found in ~/aur
# sudo pacman -R fenics-bzr

#set -o errexit
set -e

FENICS_ROOT=~/myaur/dev

CWD=`pwd`

# source repo management functions
. ~/bin/pacman-lib.sh

function removeUpdateInstall {
    # arg1: package name
    # arg2: path to directory containing PKGBUILD
    p=$1
    SRC_PATH=${2}
    echo "Removing package ${p} from local-repo-dev"
    set +e

    if ! `rmPkgDev ${p}`; then
	echo "Package ${p} already removed"
    else
	echo "Removed package ${p}"
    fi 2>/dev/null

    EX1=$?
    if [[ ${EX1} -eq 1 ]]; then
	echo "May be ${p} was not in local-repo-dev"
    elif [[ ${EX1} -ne 0 ]]; then
	echo "some other error occurred"
	exit 1
    fi
    set -e
    #echo makepkg -f --source $p
    cd ${SRC_PATH}
    #pf=`ls $p*.xz`
    #makepkg --source
    echo nice -n 18 makepkg -sfL
    nice -n 18 makepkg -sfL
    # most recent package
    PKG=`ls -clt ${FENICS_ROOT}/${p}/*.pkg.tar.xz | head -1 | gawk '{print $NF}'`
    addPkgDev ${PKG}
    #sudo pacman -R --noconfirm ${p}
    set +e
    sudo pacman -S --noconfirm local-repo-dev/${p}
    EX1=$?
    if [[ ${EX1} -eq 1 ]]; then
        # corrupt package error
	sudo pacman -S --noconfirm local-repo-dev/${p}
    elif [[ ${EX1} -ne 0 ]]; then
	echo "some other error occurred"
	exit 1
    fi
    set -e
    cd $CWD
}

#for p in instant fiat ufc ufl viper ffc dolfin; do
#for p in `ls -d *-bzr`; do
for p in fiat-bzr instant-bzr ufc-bzr ufl-bzr viper-bzr ffc-bzr dolfin-bzr; do
  removeUpdateInstall ${p} ${FENICS_ROOT}/${p}
done
