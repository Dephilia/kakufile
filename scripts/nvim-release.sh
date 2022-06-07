#! /bin/sh
#
# nvim-release.sh
# Copyright (C) 2022 dephilia <dephilia@MacBook-Pro.local>
#
# Distributed under terms of the MIT license.
#


TMP="/tmp/nvim-release"

_main(){
mkdir -p $TMP
cp -r ~/.config/nvim $TMP/config
cp -r ~/.local/share/nvim $TMP/datas
cat << EOF > $TMP/install.sh
#! /bin/sh
# This is an autogenerate file to install prebuilt
# nvim plugs.
if [ ! -d ~/.config/nvim ]; then
  mv config ~/.config/nvim
fi

if [ ! -d ~/.local/share/nvim ]; then
  mv config ~/.local/share/nvim
fi
EOF
chmod a+x $TMP/install.sh
(
cd /tmp || return
tar zcfP nvim-release.tar.gz nvim-release
)
mv /tmp/nvim-release.tar.gz .
rm -rf $TMP
}

_main 2>&1 | tee log.txt
