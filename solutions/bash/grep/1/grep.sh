#!/usr/bin/env bash

parse_opts() {
    while getopts "nlxvi" opt; do
        case $opt in
            n) print_line_numbers=1 ;;
            l) print_filename_only=1 ;;
            x) match_entire_line=1 ;;
            v) invert=1 ;;
            i) shopt -s nocasematch ;;
            *=) 
                echo "Error: Unsupported flag $1" >&2
                exit 1
                ;;
        esac
    done
    shift $((OPTIND-1))

    pattern=$1
    shift 1
    
    filenames=("$@")
}

grep_file() {
    filename=$1

    if [[ ${match_entire_line} ]]; then
        pattern="^${pattern}$"
    fi

    line_number=0
    while IFS= read -r line; do
        line_number=$(( line_number + 1 ))
        if [[ ${line} =~ $pattern ]]; then
          line_matches=1
        else
          line_matches=
        fi
        
        if [[ ( ${line_matches} && ! ${invert} ) || 
              ( ! ${line_matches} && ${invert} ) ]] 
        then
            if [[ $print_filename_only ]]; then
                echo "${filename}"
                return
            fi
            if [[ $print_filename ]]; then
                echo -n "${filename}:"
            fi
            if [[ $print_line_numbers ]]; then
                echo -n "${line_number}:"
            fi
            echo "${line}"
        fi
    done < "${filename}"
}

main() {
    parse_opts "$@"
    if [[ "${#filenames[@]}" -gt 1 ]]; then
        print_filename=1
    fi
    for filename in "${filenames[@]}"
    do
        grep_file "${filename}"
    done
}

main "$@"
