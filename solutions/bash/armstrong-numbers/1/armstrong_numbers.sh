#!/usr/bin/env bash

n=$1
digit_count=${#n}
sum=0

for (( i=0; i<${digit_count}; i++ )); do
    sum=$(( sum + ${n:$i:1} ** ${digit_count}))
done

[[ $n -eq $sum ]] && echo true || echo false
