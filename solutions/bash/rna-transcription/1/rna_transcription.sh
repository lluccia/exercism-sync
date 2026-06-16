#!/usr/bin/env bash

rna=$1

if [[ ! "$rna" =~ ^[GCTA]*$ ]]
then
    echo "Invalid nucleotide detected."
    exit 1
fi

echo $rna | tr 'GCTA' 'CGAU'