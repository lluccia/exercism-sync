def invalid_chars:
    test("^(\\d|\\s)+$") | not;

def strip_whitespaces:
    gsub("\\s";"");

strip_whitespaces |
if length <= 1 or invalid_chars then 
    false 
else
    [ 
        [  split("") | .[] | tonumber ],
        ( [ range(0; length) ] | map((. % 2) + 1) | reverse )
    ] 
    | transpose 
    | map(.[0] * .[1])
    | map(if . > 9 then . -9 else . end)
    | add
    | . % 10 == 0
end
