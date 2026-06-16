def to_bin(d):
   if d == 0 then
       "0"
   else
       "\(to_bin((d / 2 | floor)))\(d % 2)"
   end
;

to_bin(.number) / ""
| [ .[] | select(. == "1") ]
| length
