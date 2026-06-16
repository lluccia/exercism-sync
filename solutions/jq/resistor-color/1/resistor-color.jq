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

if .property == "colors" then
    colorCodes | keys_unsorted
else
    colorCodes[.input.color]
end
