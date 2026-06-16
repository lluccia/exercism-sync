import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

class Sieve {

    private final boolean[] possiblePrimes;
    private int currentPrime;

    Sieve(int maxPrime) {
        possiblePrimes = new boolean[maxPrime+1];
        Arrays.fill(possiblePrimes, true);

        possiblePrimes[0] = false;
        possiblePrimes[1] = false;

        int nextPrime;

        while ((nextPrime = getNextPrime()) != -1)
            for (int i = nextPrime*2; i < possiblePrimes.length; i = i+nextPrime)
                possiblePrimes[i] = false;
    }

    private int getNextPrime() {
        for (int i = currentPrime+1; i < possiblePrimes.length; i++) {
            if (possiblePrimes[i]) {
                currentPrime = i;
                return i;
            }
        }
        return -1;
    }

    List<Integer> getPrimes() {
        List<Integer> primes = new ArrayList<>();

        for (int i=2; i < possiblePrimes.length; i++)
            if (possiblePrimes[i])
                primes.add(i);

        return primes;
    }
}