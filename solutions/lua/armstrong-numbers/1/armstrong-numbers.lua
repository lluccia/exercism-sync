local ArmstrongNumbers = {}

function ArmstrongNumbers.is_armstrong_number(number)
    local digits = #tostring(number)
    local total = 0
    for d in tostring(number):gmatch(".") do
        total = total + tonumber(d) ^ digits
    end
    return total == number
end

return ArmstrongNumbers
