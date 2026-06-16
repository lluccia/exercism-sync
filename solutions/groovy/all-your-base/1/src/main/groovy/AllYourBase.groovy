class AllYourBase {

    private Integer inputBase
    private List<Integer> digits

    AllYourBase(inputBase, digits) {
        this.inputBase=inputBase
        this.digits=digits
    }

    def rebase(outputBase) {

        validate(outputBase)

        int number = toNumber()
        def digits = []

        while (number > 0) {
            def remainder = number % outputBase
            digits += remainder
            number /= outputBase
        }

        if (digits.isEmpty()) digits = [0]

        return digits.reverse()
    }

    private def validate(outputBase) {
        if (inputBase <= 1 || outputBase <= 1) throw new ArithmeticException("base must be greater than 1");
        if (digits.any { it < 0 }) throw new ArithmeticException("negative digits not allowed");
        if (digits.any { it >= inputBase }) throw new ArithmeticException("digits cannot be greater than base");
    }

    private def toNumber() {
        def number = 0

        digits.reverse().withIndex().each { tuple ->
            def (digit, index) = tuple
                    number += digit * inputBase ** index
        }

        return number
    }
}
