function triangle(n)
    if n < 0 
        throw(DomainError("cannot have negative rows!"))
    end

    triangle = []

    for line_idx in 1:n
        line = []

        for entry_idx in 1:line_idx
        
            if line_idx > 2 && entry_idx > 1 && entry_idx < line_idx
                previous_line = triangle[line_idx-1]
                entry = previous_line[entry_idx-1] + previous_line[entry_idx]
            else
                entry = 1
            end

            push!(line, entry)
        end

        push!(triangle, line)
    end

    return triangle
end
