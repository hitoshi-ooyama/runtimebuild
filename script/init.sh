#!/bin/bash

mkdir ${HOME}/.subversion
echo "[global]" >> ${HOME}/.subversion/servers
echo "store-plaintext-passwords = yes" >> ${HOME}/.subversion/servers
svn info http://203.189.111.249/repos/Repository2 --username ${SVN_USER} --password ${SVN_PASSWORD} --non-interactive
git config --global user.email ${GIT_EMAIL}
git config --global user.name ${GIT_USER}
git config --global color.ui auto

mkdir /usr/local/src/Repository2
cd /usr/local/src/Repository2

mkdir -p /var/cache/apt/archives/partial
mkdir -p /var/lib/apt/lists/partial

