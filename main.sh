#!/bin/bash

if [ $# -eq 1 ]; then
        length=$1
else
        length=8
fi
digits=({2..9})
lower=({a..k} {m..n} {p..z})
upper=({A..N} {P..Z})
CharArray=(${digits[*]} ${lower[*]} ${upper[*]})
ArrayLength=${#CharArray[*]}
password=""
for i in `seq 1 $length`
do
        index=$(($RANDOM%$ArrayLength))
        char=${CharArray[$index]}
        password=${password}${char}
done
echo $password

