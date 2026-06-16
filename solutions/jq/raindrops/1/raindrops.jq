.number as $number | [] | 
    if $number % 3 == 0 then . + ["Pling"] else . end |
    if $number % 5 == 0 then . + ["Plang"] else . end |
    if $number % 7 == 0 then . + ["Plong"] else . end |
    if length == 0 then
        $number
    else
        reduce .[] as $sound (""; . + $sound)
    end
