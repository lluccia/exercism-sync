local cars = {
    cost_per_unit = 10000,
    cost_per_ten= 95000
}

-- returns the amount of working cars produced by the assembly line every hour
function cars.calculate_working_cars_per_hour(production_rate, success_rate)
    return production_rate * success_rate / 100
end

-- returns the amount of working cars produced by the assembly line every minute
function cars.calculate_working_cars_per_minute(production_rate, success_rate)
    return math.floor(cars.calculate_working_cars_per_hour(production_rate, success_rate) / 60)
end

-- returns the cost of producing the given number of cars
function cars.calculate_cost(cars_count)
    local tens = math.floor(cars_count / 10)
    local remaining = cars_count - 10 * tens

    return tens * cars.cost_per_ten + remaining * cars.cost_per_unit
end

return cars
