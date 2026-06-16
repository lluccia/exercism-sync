def needs_license:
    { "car": true, "truck": true,
      "bike": false, "stroller": false, "e-scooter": false } as $needs_license |
    
    $needs_license[.];

def choose_vehicle:
   sort | "\(first) is clearly the better choice.";

def resell_price:
    if .age < 3 then
        .original_price * .8
    elif .age <= 10 then
        .original_price * .7
    else
        .original_price * .5
    end;
