def letter_grade:
    if . >= 90 then "A"
    elif .>= 80 then "B"
    elif .>= 70 then "C"
    elif .>= 60 then "D"
    else "F"
    end;

def count_letter_grades:
    . as $obj
    | reduce (values | .[] | letter_grade) as $grade 
        ( {"A":0,"B":0,"C":0,"D":0,"F":0}; .[$grade] = .[$grade]+1 );
