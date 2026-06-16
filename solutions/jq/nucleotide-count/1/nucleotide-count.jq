if .strand | test("^[ACGT]*$") then
    .strand |
        split("") |
        group_by(.) | 
        map({"key": .[0], "value": length}) |
        from_entries |
        {"A":0,"C":0,"G":0,"T":0} + .
else
    "Invalid nucleotide in strand" | halt_error
end

