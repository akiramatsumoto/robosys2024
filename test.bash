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
out=$(echo 0 | ./tri_cos)
[ "$out" = 1.0 ] || ng "$LINENO"

### 変な入力 ###
out=$(seq 5 | ./tri_cos)
[ "$?" = 1 ] || ng "$LINENO"
[ "$out" = error:2つ以上の数字が入力されました ] ||  ng "$LINENO"

out=$(echo あ | ./tri_cos)
[ "$?" = 1 ] || ng "$LINENO"
[ "$out" = "" ] || ng "$LINENO"

out=$(echo | ./tri_cos)
[ "$?" = 1 ] || ng "$LINENO"
[ "$out" = "" ] || ng "$LINENO"

### sinコマンドのテスト ###

### 通常の入力 ###
out=$(echo 0 | ./tri_sin)
[ "$out" = 0.0 ] || ng "$LINENO"

### 変な入力 ###
out=$(seq 5 | ./tri_sin)
[ "$?" = 1 ] || ng "$LINENO"
[ "$out" = error:2つ以上の数字が入力されました ] ||  ng "$LINENO"

out=$(echo あ | ./tri_sin)
[ "$?" = 1 ] || ng "$LINENO"
[ "$out" = "" ] || ng "$LINENO"

out=$(echo | ./tri_sin)
[ "$?" = 1 ] || ng "$LINENO"
[ "$out" = "" ] || ng "$LINENO"

### tanコマンドのテスト ###

### 通常の入力 ###
out=$(echo 0 | ./tri_tan)
[ "$out" = 0.0 ] || ng "$LINENO"

### 変な入力 ###
out=$(seq 5 | ./tri_tan)
[ "$?" = 1 ] || ng "$LINENO"
[ "$out" = error:2つ以上の数字が入力されました ] ||  ng "$LINENO"

out=$(echo あ | ./tri_tan)
[ "$?" = 1 ] || ng "$LINENO"
[ "$out" = "" ] || ng "$LINENO"

out=$(echo | ./tri_tan)
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

### degree_to_radianコマンドのテスト ###

### 通常の入力 ###
out=$(echo 0 | ./degree_to_radian)
[ "$out" = 0.0 ] || ng "$LINENO"

### 変な入力 ###
out=$(seq 5 | ./degree_to_radian)
[ "$?" = 1 ] || ng "$LINENO"
[ "$out" = error:2つ以上の数字が入力されました ] ||  ng "$LINENO"

out=$(echo あ | ./degree_to_radian)
[ "$?" = 1 ] || ng "$LINENO"
[ "$out" = "" ] || ng "$LINENO"

out=$(echo | ./degree_to_radian)
[ "$?" = 1 ] || ng "$LINENO"
[ "$out" = "" ] || ng "$LINENO"



[ "$res" = 0 ] && echo OK
exit "$res"
