local Darts = {}

local function radius(x, y)
     return math.sqrt(x ^ 2 +  y ^ 2)
end

function Darts.score(x, y)
    local r = radius(x, y)
    if r > 10 then
        return 0
    elseif r > 5 then
        return 1
    elseif r > 1 then
        return 5
    else
        return 10
    end
end

return Darts
