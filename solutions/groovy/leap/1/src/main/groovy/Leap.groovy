class Leap {

    final Integer year;
    
    Leap(Integer year) {
        this.year = year
    }

    def isLeapYear() {
        return (year % 4 == 0 && (year % 100 !=0 || year % 400 == 0))
    }

}
