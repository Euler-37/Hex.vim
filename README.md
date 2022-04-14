# Hex.vim
hex viewer in vim

# intro

transfer Hex string to integer and real number

# usage 

:Hex 4
:Hex 8

4 for kind=4 (32),8 for kind=8 (64),calculate from cursor to ( 8 / 16 ) characters 

```
kind=: 4 Hex=: AAAAAAAA
float,   big-endian: -3.0316488252093987e-13
int  ,   big-endian: -1431655766
float,little-endian: -3.0316488252093987e-13
int  ,little-endian: -1431655766

kind=: 4 Hex=: 12345678
float,   big-endian: 5.690456613903524e-28
int  ,   big-endian: 305419896
float,little-endian: 1.7378244361449504e+34
int  ,little-endian: 2018915346
```


