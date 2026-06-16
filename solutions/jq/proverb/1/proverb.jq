def proverb:
  if length < 2 then
    []
  else
    [ "For want of a \(.[0]) the \(.[1]) was lost.", [.[1:] | proverb ] ]
  end;

.strings | 
 if length == 0 then
     []
 else
     [ proverb , "And all for the want of a \(.[0])." ] | flatten
 end

