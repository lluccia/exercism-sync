public class Lasagna {
    public int expectedMinutesInOven() {
        return 40;
    }
    
    public int remainingMinutesInOven(int elapsedMinutesInOven) {
        return expectedMinutesInOven() - elapsedMinutesInOven;
    }
    
    public int preparationTimeInMinutes(int numberOfLayers) {
        return 2*numberOfLayers;
    }
    
    public int totalTimeInMinutes(int numberOfLayers, int elapsedMinutesInOven) {
        return preparationTimeInMinutes(numberOfLayers) + elapsedMinutesInOven;
    }
}
