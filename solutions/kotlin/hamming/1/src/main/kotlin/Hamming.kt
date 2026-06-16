import java.lang.IllegalArgumentException

object Hamming {

    fun compute(leftStrand: String, rightStrand: String): Int {
        if (leftStrand.length != rightStrand.length)
            throw IllegalArgumentException("left and right strands must be of equal length");

        var hammingDistance:Int = 0;

        leftStrand.forEachIndexed { index, c ->
            if (c != rightStrand[index]) hammingDistance+=1;
        };

        return hammingDistance;
    }
}
