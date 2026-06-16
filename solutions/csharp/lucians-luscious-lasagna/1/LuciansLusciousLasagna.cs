class Lasagna
{
    public int ExpectedMinutesInOven() => 40;

    public int RemainingMinutesInOven(int actualMinutes) =>
        ExpectedMinutesInOven() - actualMinutes;

    public int PreparationTimeInMinutes(int layers) =>2*layers;

    public int ElapsedTimeInMinutes(int layers, int minutesInOven) =>
        PreparationTimeInMinutes(layers) + minutesInOven;
}
