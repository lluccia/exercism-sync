# shopping list name
.name,

# required ingredients count
( .ingredients | length ),

# amount of sugar
( .ingredients[] | select(.item == "sugar") | .amount.quantity ),

# ingredient substitutions
( reduce ( ([ .ingredients, ."optional ingredients" ] | flatten ) | .[] | select(.substitute) | { (.item): .substitute } ) as $item ({}; . * $item) )
 