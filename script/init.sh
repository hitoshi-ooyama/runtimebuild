#!/bin/bash

mkdir ${HOME}/.subversion
echo "[global]" >> ${HOME}/.subversion/servers
echo "store-plaintext-passwords = yes" >> ${HOME}/.subversion/servers
svn info http://${SVN_ADDR}/repos/Repository2 --username ${SVN_USER} --password ${SVN_PASSWORD} --non-interactive
git config --global user.email ${GIT_EMAIL}
git config --global user.name ${GIT_USER}
git config --global color.ui auto

# download gingerbread source
cd /usr/local/src/android/gingerbread
repo init -u https://android.googlesource.com/platform/manifest -b gingerbread
repo sync

# download Repo2 source
mkdir /usr/local/src/Repository2
cd /usr/local/src/Repository2
svn checkout http://${SVN_ADDR}/repos/Repository2/trunk/project

mkdir -p /var/cache/apt/archives/partial
mkdir -p /var/lib/apt/lists/partial
