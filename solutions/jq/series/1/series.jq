def validate(seriesLength; sliceLength):
  if seriesLength == 0 then
      "series cannot be empty" | halt_error
  elif sliceLength > seriesLength then
      "slice length cannot be greater than series length" | halt_error
  elif sliceLength == 0 then
      "slice length cannot be zero" | halt_error
  elif sliceLength < 0 then
      "slice length cannot be negative" | halt_error
  else
      .
  end
;

( .series / "" ) as $items | ( .series | length ) as $seriesLength
| .sliceLength as $sliceLength
| validate($seriesLength; $sliceLength)
| [ range(0; ($items | length) - $sliceLength + 1) ]
| map($items[. : . + $sliceLength] | add )
