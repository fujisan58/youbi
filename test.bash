#!/bin/bash
# SPDX-FileCopyrightText: 2026 Shota Fujii
# SPDX-License-Identifier: BSD-3-Clause

ng () {
        echo ${1}行目のテスト失敗
        res=1
}

res=0

out=$(./youbi 2005-04-01)
[ "$?" = 0 ] || ng "$LINENO"
[ "${out}" = "2005-04-01 金曜日" ] || ng "$LINENO"

out=$(./youbi あいう)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

[ "${res}" = 0 ] && echo OK
exit $res
