#!/usr/bin/env bash


validate_args() {
    if [ "$#" -ne 2 ]; then
        echo "Usage: hamming.sh <string1> <string2>"
        exit 1
    fi
}

validate_strands() {
    if [[ "$strand1_length" != "$strand2_length" ]]; then
        echo "left and right strands must be of equal length"
        exit 1
    fi
}

hamming_distance() {
    distance=0

    for i in $(seq 0 "$strand1_length")
    do
        if [[ "${strand1:$i:1}" != "${strand2:$i:1}" ]]; then
            distance=$((distance+1))
        fi
    done
    
    echo $distance
}

validate_args "$@"

strand1=$1
strand2=$2
strand1_length=${#strand1}
strand2_length=${#strand2}

validate_strands "$1" "$2"
hamming_distance "$1" "$2" 
