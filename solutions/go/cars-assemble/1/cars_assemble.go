package cars

func CalculateWorkingCarsPerHour(productionRate int, successRate float64) float64 {
    return float64(productionRate) * (successRate / 100)
}

func CalculateWorkingCarsPerMinute(productionRate int, successRate float64) int {
    return int(CalculateWorkingCarsPerHour(productionRate, successRate)) / 60
}

func CalculateCost(carsCount int) uint {
    var tenths int = carsCount / 10
    return uint(tenths) * 95000 + uint(carsCount - 10 * tenths) * 10000
}
