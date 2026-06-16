public class CarsAssemble {

    public double productionRatePerHour(int speed) {
        var productionRate = speed * 221;
        var successRate = 0.0;
        if (speed <= 4) {
            successRate = 1;
        } else if (speed <= 8) {
            successRate = 0.9;
        } else if (speed == 9) {
            successRate = 0.8;
        } else {
            successRate = 0.77;
        }
        
        return productionRate * successRate;
    }

    public int workingItemsPerMinute(int speed) {
        return (int) Math.floor(productionRatePerHour(speed) / 60);
    }
}
