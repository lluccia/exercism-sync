class Darts {

    static int score(x, y) {
        def centerDistance = Math.sqrt( x**2 + y**2 )

        if ( centerDistance <= 1 ) return 10
        if ( centerDistance <= 5 ) return 5
        if ( centerDistance <= 10 ) return 1

        return 0
    }
}
