def group_consecutive(remaining; previous; grouped):
    if (remaining | length) > 0 then
        group_consecutive(
            remaining[1:];
            remaining[0];
            grouped + 
                if remaining[0] == previous then [] else ["#"] end +
                [remaining[0]])
    else
        grouped
    end
;

def encode:
    split("")
    | group_consecutive(.; .[0]; [])
    | join("") | split("#")
    | map("\(if length > 1 then length else "" end)\(. | split("") | first)")
    | join("");

def decode:
    gsub("(?<times>\\d+)(?<c>\\D)"; "\((.times | tonumber) * .c)");
