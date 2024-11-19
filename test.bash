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
[ "$out" = error:2つ以上の数字が入力されました ] ||  ng "$LINENO"

out=$(echo あ | ./cos)
[ "$?" = 1 ] || ng "$LINENO"
[ "$out" = "" ] || ng "$LINENO"

out=$(echo | ./cos)
[ "$?" = 1 ] || ng "$LINENO"
[ "$out" = "" ] || ng "$LINENO"

### sinコマンドのテスト ###

### 通常の入力 ###
out=$(echo 0 | ./sin)
[ "$out" = 0.0 ] || ng "$LINENO"

### 変な入力 ###
out=$(seq 5 | ./sin)
[ "$?" = 1 ] || ng "$LINENO"
[ "$out" = error:2つ以上の数字が入力されました ] ||  ng "$LINENO"

out=$(echo あ | ./sin)
[ "$?" = 1 ] || ng "$LINENO"
[ "$out" = "" ] || ng "$LINENO"

out=$(echo | ./sin)
[ "$?" = 1 ] || ng "$LINENO"
[ "$out" = "" ] || ng "$LINENO"

### tanコマンドのテスト ###

### 通常の入力 ###
out=$(echo 0 | ./tan)
[ "$out" = 0.0 ] || ng "$LINENO"

### 変な入力 ###
out=$(seq 5 | ./tan)
[ "$?" = 1 ] || ng "$LINENO"
[ "$out" = error:2つ以上の数字が入力されました ] ||  ng "$LINENO"

out=$(echo あ | ./tan)
[ "$?" = 1 ] || ng "$LINENO"
[ "$out" = "" ] || ng "$LINENO"

out=$(echo | ./tan)
[ "$?" = 1 ] || ng "$LINENO"
[ "$out" = "" ] || ng "$LINENO"

### log_10コマンドのテスト ###

### 通常の入力 ###
out=$(echo 1 | ./log_10)
[ "$out" = 0.0 ] || ng "$LINENO"

### 変な入力 ###
out=$(seq 5 | ./log_10)
[ "$?" = 1 ] || ng "$LINENO"
[ "$out" = error:2つ以上の数字が入力されました ] ||  ng "$LINENO"

out=$(echo あ | ./log_10)
[ "$?" = 1 ] || ng "$LINENO"
[ "$out" = "" ] || ng "$LINENO"

out=$(echo | ./log_10)
[ "$?" = 1 ] || ng "$LINENO"
[ "$out" = "" ] || ng "$LINENO"

out=$(echo -1 | ./log_10)
[ "$?" = 1 ] || ng "$LINENO"
[ "$out" = "" ] || ng "$LINENO"

### log_eコマンドのテスト ###

### 通常の入力 ###
out=$(echo 1 | ./log_e)
[ "$out" = 0.0 ] || ng "$LINENO"

### 変な入力 ###
out=$(seq 5 | ./log_e)
[ "$?" = 1 ] || ng "$LINENO"
[ "$out" = error:2つ以上の数字が入力されました ] ||  ng "$LINENO"

out=$(echo あ | ./log_e)
[ "$?" = 1 ] || ng "$LINENO"
[ "$out" = "" ] || ng "$LINENO"

out=$(echo | ./log_e)
[ "$?" = 1 ] || ng "$LINENO"
[ "$out" = "" ] || ng "$LINENO"

out=$(echo -1 | ./log_e)
[ "$?" = 1 ] || ng "$LINENO"
[ "$out" = "" ] || ng "$LINENO"



[ "$res" = 0 ] && echo OK
exit "$res"
