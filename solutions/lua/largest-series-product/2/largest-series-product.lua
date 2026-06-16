return function(config)
    assert(config.span <= #config.digits, "spans cannot be larger than the string length")
    assert(config.span > 0, "span must be greater than 0")

    local largest_product = 0

    for i = 1, #config.digits - config.span + 1 do
        local serie = string.sub(config.digits, i, i + config.span - 1)

        if not string.find(serie, "0") then
            local product = 1
            for j = 1, #serie do
                product = product * tonumber(string.sub(serie, j, j))
            end
            largest_product = math.max(product, largest_product)
        end
    end

    return largest_product
end
