#! /bin/sh
#
# kaku_commit.sh
# Copyright (C) 2022 dephilia <dephilia@MacBook-Pro.local>
#
# Distributed under terms of the MIT license.
#

# Because now git user information is seperated, use this script
# to make it easy to commit.

${KAKU_ROOT}/scripts/setgit.sh && git commit && ${KAKU_ROOT}/scripts/unsetgit.sh
