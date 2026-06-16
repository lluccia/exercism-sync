#!/usr/bin/env bash

is_pangram() {
    word=$1
    lowercase_word=$(echo "$word" | tr "[:upper:]" "[:lower:]")
    letters=$(echo "$lowercase_word" | sed -E "s/[^[:lower:]]//g") 
    
    distinct_letters_count=$(echo "$letters" | fold -w 1 | sort | uniq | wc -l )
    if [[ $distinct_letters_count -ne 26 ]]; then
        echo "false"
        return
    fi

    echo "true"
}

is_pangram "$1"
