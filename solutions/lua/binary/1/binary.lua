local function to_decimal(input)
    local decimal = 0
    local power = 0
    for i = #input, 1, -1 do
        local binary_digit = tonumber(input:sub(i,i))
        if not binary_digit then
            return 0
        end

        decimal = decimal + binary_digit * 2 ^ power
        power = power + 1
    end
    return decimal
end

return {
    to_decimal = to_decimal
}
