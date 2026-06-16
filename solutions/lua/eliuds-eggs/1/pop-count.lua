local PopCount = {}

function PopCount.egg_count(number)
    local count = 0
    local remaining = number

    while remaining > 0 do
        if remaining % 2 == 1 then count=count+1 end
        remaining = math.floor(remaining / 2)
    end

    return count
end

return PopCount
