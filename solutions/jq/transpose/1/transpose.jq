def max_length:
    map(length) | max;

def get_column($splitted_lines; $column):
    [ $splitted_lines[] | if .[$column] == null then "☠" else .[$column] end ] | join("");

if .lines | length == 0 then
    []
else
    [.lines[] | split("")] as $splitted_lines
    | $splitted_lines | max_length  as $max_length
    | [ range($splitted_lines | $max_length)
        | get_column($splitted_lines; .) 
        | gsub("☠+$"; "") | gsub("☠"; " ") ] 
end
