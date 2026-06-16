def production_rate_per_hour:
  . as $speed | $speed * 221 |
      if $speed <= 4 then
        .
      elif $speed <= 8 then
        . * 0.9
      elif $speed <= 9 then
        . * 0.8
      else
        . * 0.77
      end
;

def working_items_per_minute:
  production_rate_per_hour / 60 | trunc
;

.speed | (production_rate_per_hour, working_items_per_minute)
