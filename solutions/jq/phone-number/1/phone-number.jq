def remove_spaces_and_punctuation:
    gsub("[ ()+.-]";"");

def cleanup:
   gsub("\\D";"") | gsub("^1";"");

.phrase | remove_spaces_and_punctuation |
    if test("[a-z]") then
        "letters not permitted" | halt_error
    elif test("[@:!]") then
        "punctuations not permitted" | halt_error
    elif length < 10 then
        "must not be fewer than 10 digits" | halt_error
    elif length == 10 and test("^0") then
        "area code cannot start with zero" | halt_error
    elif length == 10 and test("^1") then
        "area code cannot start with one" | halt_error
    elif length == 10 and test("^...0") then
        "exchange code cannot start with zero" | halt_error
    elif length == 10 and test("^...1") then
        "exchange code cannot start with one" | halt_error
    elif length == 11 and test("^[^1]") then
        "11 digits must start with 1" | halt_error
    elif length == 11 and test("^.0") then
        "area code cannot start with zero" | halt_error
    elif length == 11 and test("^.1") then
        "area code cannot start with one" | halt_error
    elif length == 11 and test("^....0") then
        "exchange code cannot start with zero" | halt_error
    elif length == 11 and test("^....1") then
        "exchange code cannot start with one" | halt_error
    elif length > 11 then
        "must not be greater than 11 digits" | halt_error       
    else
        . | cleanup
    end
