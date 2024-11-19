# 疑似関数電卓
![test](https://github.com/akiramatsumoto/robosys2024/actions/workflows/test.yml/badge.svg)  

- [概要](#概要)
- [使い方](#使い方)
	- [インストール方法](#インストール方法)
	- [実行方法](#実行方法)
		- [sinコマンド](#sinコマンド)
		- [cosコマンド](#cosコマンド)
		- [tanコマンド](#tanコマンド)
		- [log_10コマンド](#log_10コマンド)
		- [log_eコマンド](#log_eコマンド)
		- [degree_to_radianコマンド](#degree_to_radianコマンド)
		- [set_consts.bashファイル](#set_consts.bashファイル)
		- [plusコマンド](plusコマンド)
	- [応用](#応用)
- [要求環境](#要求環境)
	- [必要なソフトウェア](#必要なソフトウェア)
	- [テスト環境](#テスト環境)
- [ライセンス](#ライセンス)
	
## 概要
- ターミナル上で数学関数（三角関数, 対数関数）を求めるためのコマンドが入っています.
- bcコマンド（四則演算）と組み合わせることでターミナルを疑似的に関数電卓にすることができます.
- ターミナルで作業をしている際, 場所を変えることなく計算を行えます.

## 使い方
### インストール方法
以下のコマンドをターミナル上で入力します.
```
git clone https://github.com/akiramatsumoto/robosys2024.git
cd robosys2024
```
### 実行方法
#### sinコマンド
入力nに対しsin(n)を出力します.  
nはラジアンです.
- 実行例
```
echo 0 | ./sin
```
- 実行結果
```
0.0
```
#### cosコマンド
入力nに対しcos(n)を出力します.  
nはラジアンです.
- 実行例
```
echo 0 | ./cos
```
- 実行結果
```
1.0
```
#### tanコマンド
入力nに対しtan(n)を出力します.  
nはラジアンです.
- 実行例
```
echo 0 | ./tan
```
- 実行結果
```
0.0
```
#### log_10コマンド
入力nに対しlog10(n)を出力します.  
- 実行例
```
echo 1 | ./log_10
```
- 実行結果
```
0.0
```
#### log_eコマンド
入力nに対しloge(n)を出力します.
- 実行例
```
echo 1 | ./log_e
```
- 実行結果
```
0.0
```
#### degree_to_radianコマンド
角度をラジアンに変換します.
- 実行例
```
echo 180 | ./degree_to_radian
```
- 実行結果
```
3.141592653589793
```
#### set_consts.bashファイル
実行すると円周率πとネイピア数eが変数として保存されます.
- 実行例
```
source set_consts.bash
echo $pi
echo $e
```
- 実行結果
```
3.141592653589793
2.718281828459045
```
#### plusコマンド
標準入力から読み込んだ数字を足します.
- 実行例
```
seq 5 | ./plus
```
- 実行結果
```
15
``` 
### 応用
bcコマンドと組み合わせることで複雑な計算も行うことができます.  
ここでは，cos(π)+loge(e^3)を求めます．
- 実行例
```
source set_consts.bash
cos_pi=$(echo $pi | ./cos) #cos(π)
log_e_cuded=$(echo "$e^3" | bc | ./log_e) #loge(e^3)
echo "$cos_pi + $log_e_cuded" | bc
```
- 実行結果
```
1.9999999999999996
```
数値計算を行っているので若干のズレはありますが, このようにして求めることができます.

## 要求環境
### 必要なソフトウェア
- Python
	- テスト済みバージョン: 3.7~3.10

### テスト環境
- Ubuntu 24.04 LTS

## ライセンス
- このソフトウェアパッケージは，3条項bsdライセンスの下，再頒布および使用が許可されます．
- このパッケージのコードは，下記のスライド（cc-by-sa 4.0 by ryuichi ueda）のものを，本人の許可を得て自身の著作としたものです．
    - [ryuichiueda/my_slides robosys_2024](https://github.com/ryuichiueda/my_slides/tree/master/robosys_2024)

© 2024 akira matsumoto
