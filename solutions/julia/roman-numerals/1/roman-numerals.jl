numerals = [
    (1000, "M"),
    (900, "CM"),
    (500, "D"),
    (400, "CD"),
    (100, "C"),
    (90, "XC"),
    (50, "L"),
    (40, "XL"),
    (10, "X"),
    (9, "IX"),
    (5, "V"),
    (4, "IV"),
    (1, "I"),
]

function to_roman(number)
    if number < 1
        throw(ErrorException("number must be greater than 0"))
    end

    roman = ""

    for n in numerals
        while number >= n[1]
            roman = roman * n[2]
            number = number - n[1]
        end
    end

    return roman
end
