return function(config)
    if config.span > #config.digits then
        error("spans cannot be larger than the string length")
    end

    if config.span <= 0 then
        error("span must be greater than 0")
    end

    local products = {}

    for i = 1, #config.digits - config.span + 1 do
        local serie = string.sub(config.digits, i, i + config.span - 1)

        if string.find(serie, "0") then
            table.insert(products, 0)
        else
            local product = 1
            for j = 1, #serie do
                product = product * tonumber(string.sub(serie, j, j))
            end
            table.insert(products, product)
        end
    end

    table.sort(products, function(a, b) return a > b end)

    return products[1]
end
