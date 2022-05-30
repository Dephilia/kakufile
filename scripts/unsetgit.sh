#! /bin/sh
#
# unsetgit.sh
# Copyright (C) 2022 dephilia <dephilia@MacBook-Pro.local>
#
# Distributed under terms of the MIT license.
#

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  OS=linux
elif [[ "$OSTYPE" == "darwin"* ]]; then
  OS=mac
fi
git config --global --unset core.excludesfile "${KAKU_ROOT}/git/gitignore/${OS}/gitignore_global"
git config --global --unset commit.template "${KAKU_ROOT}/git/gitmessage"
git config --global --unset user.name Dephilia
git config --global --unset user.email me@dephilia.moe
git config --global --unset user.signingkey 58E5D48B
