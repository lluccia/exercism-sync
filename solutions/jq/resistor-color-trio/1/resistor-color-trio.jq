def colorCodes:
    { 
        black:  0,
        brown:  1,
        red:    2,
        orange: 3,
        yellow: 4,
        green:  5,
        blue:   6,
        violet: 7,
        grey:   8,
        white:  9
    };

def prefix: [ "", "kilo", "mega", "giga" ];

def prefix_index:
    [while(. > 1000; . / 1000)] | length
;

def remove_multiplier:
    until(. < 1000; . / 1000) 
;

def resistor_value: 
    ("\(colorCodes[.colors[0]])\(colorCodes[.colors[1]])" | tonumber) 
    * pow(10; colorCodes[.colors[2]])
;

def unit:
    prefix[resistor_value | prefix_index] + 
    "ohms";

{
    "value": resistor_value | remove_multiplier,
    "unit": unit
}
