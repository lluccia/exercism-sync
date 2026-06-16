40 as $expected_minutes_in_oven |
2 as $minutes_per_layer |
( .actual_minutes_in_oven // 0 ) as $actual_minutes_in_oven |
( $expected_minutes_in_oven - $actual_minutes_in_oven ) as $remaining_minutes_in_oven |
( $minutes_per_layer * ( .number_of_layers // 1 )) as $preparation_time |
( $preparation_time + $actual_minutes_in_oven ) as $total_time |

{
  "expected_minutes_in_oven": $expected_minutes_in_oven,
  "remaining_minutes_in_oven": $remaining_minutes_in_oven,
  "preparation_time": $preparation_time,
  "total_time": $total_time
}
