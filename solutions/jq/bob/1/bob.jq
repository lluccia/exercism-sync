def contains_uppercase_letter:
    test("[A-Z]");

def is_question:
    test("\\?\\s*$");

def is_silence:
    test("^\\s*$");

def is_shouting:
    test("^[A-Z0-9 '%^*@#$()*,;.!?]+$") and contains_uppercase_letter;

if .heyBob | is_shouting and is_question then
    "Calm down, I know what I'm doing!"
elif .heyBob | is_shouting then
    "Whoa, chill out!"
elif .heyBob | is_question then
    "Sure."
elif .heyBob | is_silence then
    "Fine. Be that way!"
else
    "Whatever."
end
