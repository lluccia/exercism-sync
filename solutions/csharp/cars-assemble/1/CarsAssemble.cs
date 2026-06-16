using System;

static class AssemblyLine
{
    private const int CARS_PER_HOUR = 221;

    public static double SuccessRate(int speed)
    {
        return speed switch
        {
            0    => 0,
            <= 4 => 1.0,
            <= 8 => 0.9,
            <= 9 => 0.8,
            10   => 0.77,
            _    => throw new ArgumentOutOfRangeException("speed range is 0 to 10. supplied " + speed),
        };
    }
    
    public static double ProductionRatePerHour(int speed)
    {
        return speed * CARS_PER_HOUR * SuccessRate(speed);
    }

    public static int WorkingItemsPerMinute(int speed)
    {
        return (int) Math.Floor(ProductionRatePerHour(speed) / 60);
    }
}
