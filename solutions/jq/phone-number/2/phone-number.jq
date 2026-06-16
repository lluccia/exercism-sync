def remove_formatting:
    gsub("[ ()+.-]";"");

def parse_number:
    { country_code: .[-11:-10], area_code: .[-10:-7], exchange_code: .[-7:] };

.phrase | remove_formatting |
    if test("[a-z]") then
        "letters not permitted" | halt_error
    elif test("[@:!]") then
        "punctuations not permitted" | halt_error
    elif length < 10 then
        "must not be fewer than 10 digits" | halt_error
    elif length > 11 then
        "must not be greater than 11 digits" | halt_error       
    else
        parse_number | 
        if .area_code[0:1] == "0" then
            "area code cannot start with zero" | halt_error
        elif .area_code[0:1] == "1" then
            "area code cannot start with one" | halt_error
        elif .exchange_code[0:1] == "0" then
            "exchange code cannot start with zero" | halt_error
        elif .exchange_code[0:1] == "1" then
            "exchange code cannot start with one" | halt_error
        elif .country_code != "" and .country_code != "1" then
            "11 digits must start with 1" | halt_error
        else
            .area_code + .exchange_code
        end
    end
