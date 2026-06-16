return function(s)
    local matrix = {}

    for s_row in string.gmatch(s, "([^\n]+)") do
        local row = {}
        for s_col in string.gmatch(s_row, "([^ ]+)") do
            table.insert(row, tonumber(s_col))
        end
        table.insert(matrix, row)
    end

    return {
        row = function(r)
            return matrix[r]
        end,
        column = function(c)
            local column = {}
            for _, row in ipairs(matrix) do
               table.insert(column, row[c])
            end
            return column
        end
    }
end
