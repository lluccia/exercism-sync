#!/usr/bin/env bash

to_upper() {
    echo "$1" | tr '[:lower:]' '[:upper:]'
}

main () {
    IFS=$IFS"-_*?" # word delimiters - $IFS (Internal Field Separator) defaults are space, tab and newline

    acronym=""
    for word in $1
    do
        first_letter=${word:0:1}
        acronym=${acronym}${first_letter}
    done
    to_upper "${acronym}"
}

main "$@"
