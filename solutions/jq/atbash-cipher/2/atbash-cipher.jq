.input.phrase as $input |
.property as $operation |

{ "plain":  "abcdefghijklmnopqrstuvwxyz0123456789",
  "cipher": "zyxwvutsrqponmlkjihgfedcba0123456789" } |
  [ (.plain | explode), (.cipher | explode) ] | transpose |
  reduce .[] as [$i,$j] ({}; . + { ($i | tostring): $j }) | . as $cipher_map |

$input | gsub("[^a-zA-Z0-9]"; "") | ascii_downcase | 
  explode | map($cipher_map[.|tostring]) | implode |
  if $operation == "encode" then 
    gsub("(?<x>.{5})"; "\(.x) ") | rtrimstr(" ")
  else
    .
  end
