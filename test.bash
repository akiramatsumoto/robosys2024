#!/bin/bash -xv
# SPDX-FileCopyrightText: 2024 Akira Matsumoto <akiram8427@gmail.com>
# SPDX-License-Identifier: BSD-3-Clause

ng () {
	echo ${1}行目が違うよ
	res=1
}

res=0

### plusコマンドのテスト ###

### 通常の入力 ###
out=$(seq 5 | ./plus)
[ "$out" = 15 ] || ng "$LINENO"

### 変な入力 ###
out=$(echo あ | ./plus)
[ "$?" = 1 ] || ng "$LINENO"
[ "$out" = "" ] || ng "$LINENO"

out=$(echo | ./plus)
[ "$?" = 1 ] || ng "$LINENO"
[ "$out" = "" ] || ng "$LINENO"

### cosコマンドのテスト ###

### 通常の入力 ###
out=$(echo 0 | ./cos)
[ "$out" = 1.0 ] || ng "$LINENO"

### 変な入力 ###
out=$(seq 5 | ./cos)
[ "$?" = 1 ] || ng "$LINENO"
[ "$out" = "" ] ||  ng "$LINENO"

out=$(echo あ | ./cos)
[ "$?" = 1 ] || ng "$LINENO"
[ "$out" = "" ] || ng "$LINENO"

out=$(echo | ./cos)
[ "$?" = 1 ] || ng "$LINENO"
[ "$out" = "" ] || ng "$LINENO"

[ "$res" = 0 ] && echo OK
exit "$res"
