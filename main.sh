#!/bin/bash
# generate random password

if [ $# -eq 1 ]; then
    length=$1
else
    length=12
fi
lowercase=({a..k} {m..n} {p..z})        # l looks like 1, o looks like 0, so we skip them
uppercase=({A..N} {P..Z})               # O looks like 0, so we skip it
number=({0..9})
combination=(${number[*]} ${lowercase[*]} ${uppercase[*]})
clength=${#combination[*]}
password=""
for i in `seq 1 $length`
do
    index=$(($RANDOM%$clength))
    value=${combination[$index]}
    password=${password}${value}
done
echo $password
