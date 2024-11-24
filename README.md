# 疑似関数電卓
[![test](https://github.com/akiramatsumoto/robosys2024/actions/workflows/test.yml/badge.svg)](https://github.com/akiramatsumoto/robosys2024/actions/workflows/test.yml)
- [概要](#概要)
- [使い方](#使い方)
	- [リポジトリのクローン方法](#リポジトリのクローン方法)
	- [実行方法](#実行方法)
		- [定数の設定と表示](#定数の設定と表示)
			- [set_consts.bashファイル](#set_consts.bashファイル)
			- [print_piコマンド](#print_piコマンド)
			- [print_eコマンド](#print_eコマンド)
		- [三角関数](#三角関数)
			- [tri_sinコマンド](#tri_sinコマンド)
			- [tri_cosコマンド](#tri_cosコマンド)
			- [tri_tanコマンド](#tri_tanコマンド)
		- [単位変換](#単位変換)
			- [degree_to_radianコマンド](#degree_to_radianコマンド)
		- [対数関数](#対数関数)
			- [log_10コマンド](#log_10コマンド)
			- [log_eコマンド](#log_eコマンド)
		- [総和](#総和)
			- [plusコマンド](#plusコマンド)
	- [応用](#応用)
- [要求環境](#要求環境)
	- [必要なソフトウェア](#必要なソフトウェア)
	- [テスト環境](#テスト環境)
- [ライセンス](#ライセンス)

# 概要
- ターミナル上で数学関数（三角関数, 対数関数）を求めるためのコマンドが入っています.
- bcコマンド（四則演算）と組み合わせることでターミナルを疑似的に関数電卓にすることができます.
- ターミナルで作業をしている際, 場所を変えることなく計算を行えます.

# 使い方
## リポジトリのクローン方法
以下のコマンドをターミナル上で入力します.
```
git clone https://github.com/akiramatsumoto/robosys2024.git
cd robosys2024
```
## 実行方法
### 定数の設定と表示
#### set_consts.bashファイル
実行すると円周率πとネイピア数eの近似値が変数として保存されます.  
後述するprint_piコマンドとprint_eコマンドを利用しています.
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
#### print_piコマンド
円周率πの近似値を表示します.
- 実行例
```
./print_pi
```
- 実行結果
```
3.141592653589793
```
#### print_eコマンド
ネイピア数eを近似値を表示します.
- 実行例
```
./print_e
```
- 実行結果
```
2.718281828459045
```
### 三角関数
#### tri_sinコマンド
入力nに対しsin(n)を出力します.  
nはラジアンです.
- 実行例
```
source set_consts.bash   # πを設定
echo "scale=15; $pi / 2" | bc | ./tri_sin    # sin(π/2)を計算
```
- 実行結果
```
1.0
```
#### tri_cosコマンド
入力nに対しcos(n)を出力します.  
nはラジアンです.
- 実行例
```
source set_consts.bash   # πを設定
echo $pi | ./tri_cos   # cos(π)を計算
```
- 実行結果
```
-1.0
```
#### tri_tanコマンド
入力nに対しtan(n)を出力します.  
nはラジアンです.
- 実行例
```
source set_consts.bash   # πを設定
echo "scale=15; $pi / 4" | bc | ./tri_tan   # tan(π/4)を計算
```
- 実行結果
```
0.9999999999999992   
```
πの値は近似値なので計算結果にも若干の誤差が表れることがあります.
### 単位変換
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
### 対数関数
#### log_10コマンド
入力nに対しlog10(n)を出力します.  
- 実行例
```
echo 1000 | ./log_10
```
- 実行結果
```
3.0
```
#### log_eコマンド
入力nに対しloge(n)を出力します.
- 実行例
```
source set_consts.bash   # eを設定
echo $e | ./log_e
```
- 実行結果
```
1.0
```
## 総和
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
## 応用
[実行方法](#実行方法)でも一部で用いていますが, bcコマンドと組み合わせることで複雑な計算も行うことができます.  
ここでは, cos(π)+loge(e^3)を求めます.
- 実行例
```
source set_consts.bash
cos_pi=$(echo $pi | ./tri_cos)   # cos(π)
log_e_cuded=$(echo "$e^3" | bc | ./log_e)   # loge(e^3)
echo "$cos_pi + $log_e_cuded" | bc   # cos(π)+loge(e^3)
```
- 実行結果
```
1.9999999999999996
```
数値計算を行っているので若干のズレはありますが, このようにして求めることができます.

# 要求環境
## 必要なソフトウェア
- Python
	- テスト済みバージョン: 3.7~3.10

## テスト環境
- Ubuntu 24.04 LTS

# ライセンス
- このソフトウェアパッケージは, 3条項BSDライセンスの下, 再頒布および使用が許可されます.
- このパッケージのコードの一部は, 下記のスライド（CC-BY-SA 4.0 by ryuichi ueda）のものを, 本人の許可を得て自身の著作としたものです.
    - [ryuichiueda/my_slides robosys_2024](https://github.com/ryuichiueda/slides_marp/tree/master/robosys2024)

© 2024 akira matsumoto
