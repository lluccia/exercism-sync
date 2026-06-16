def with_time:
    if . | contains("T") | not then 
        . + "T00:00:00Z"
    else
        .
    end;

def at_zulu_timezone:
    if . | endswith("Z") | not then
        . + "Z"
    else
        .
    end;

1000000000 as $gigasecond |
    .moment | with_time | at_zulu_timezone | fromdate |
    . + $gigasecond |
    todate | .[:-1]
