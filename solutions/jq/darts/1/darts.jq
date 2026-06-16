def radius(x;y):
    x*x + y*y | sqrt;

radius(.x; .y) as $radius |
if $radius <= 1 then 10
elif $radius <= 5 then 5
elif $radius <= 10 then 1
else 0
end
