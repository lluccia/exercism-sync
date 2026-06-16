def build_roaster:
    unique_by(.[0]) |
    reduce .[] as [$student, $grade] ({}; .[$grade | tostring] += [$student]) |
    to_entries | sort_by(.key) | from_entries;

def list_all:
    [ to_entries | .[] | .value ] | flatten;

def list_grade($grade):
    if has($grade) then .[$grade] else [] end;

.property as $property | .input.desiredGrade as $desiredGrade |
.input.students | 
    build_roaster |
    if ($property == "grade") then
        list_grade($desiredGrade | tostring)
    else
        list_all
    end
