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

out=$(./youbi 2005/4/1)
[ "$?" = 0 ] || ng "$LINENO"
[ "${out}" = "2005-04-01 金曜日" ] || ng "$LINENO"

out=$(./youbi 令和8年11月25日)
[ "$?" = 0 ] || ng "$LINENO"
[ "${out}" = "2026-11-25 水曜日" ] || ng "$LINENO"

out=$(./youbi 平成17年4月1日)
[ "$?" = 0 ] || ng "$LINENO"
[ "${out}" = "2005-04-01 金曜日" ] || ng "$LINENO"

out=$(./youbi 昭和64年1月7日)
[ "$?" = 0 ] || ng "$LINENO"
[ "${out}" = "1989-01-07 土曜日" ] || ng "$LINENO"

out=$(printf "2005-04-01\n1989-01-07\n" | ./youbi)
[ "$?" = 0 ] || ng "$LINENO"
[ "${out}" = "$(printf "2005-04-01 金曜日\n1989-01-07 土曜日")" ] || ng "$LINENO"

out=$(./youbi あいう)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(./youbi 2005-02-30)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(printf "2005-04-01\nあいう\n1989-01-07\n" | ./youbi)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "$(printf "2005-04-01 金曜日\n1989-01-07 土曜日")" ] || ng "$LINENO"

[ "${res}" = 0 ] && echo OK
exit $res
