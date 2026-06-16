class Hamming {

    def distance(strand1, strand2) {
        def distance = 0

        if (strand1.size() == 0 && strand2.size() == 0)
            return distance

        if (strand1.size() != strand2.size()) 
            throw new ArithmeticException("strands must have the same size!")

        (0..strand1.size()-1).findAll { i -> strand1[i] != strand2[i] }.each{ distance++ }

        return distance
    }
}

