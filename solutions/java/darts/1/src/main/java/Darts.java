class Darts {

    private static final int OUTER_CIRCLE_RADIUS = 10;
    private static final int MIDDLE_CIRCLE_RADIUS = 5;
    private static final int INNER_CIRCLE_RADIUS = 1;

    private double radius;

    Darts(double x, double y) {
        radius = Math.sqrt(x * x + y * y);
    }

    int score() {
        if (radius <= INNER_CIRCLE_RADIUS)
            return 10;
        if (radius <= MIDDLE_CIRCLE_RADIUS)
            return 5;
        if (radius <= OUTER_CIRCLE_RADIUS)
            return 1;

        return 0;
    }
}
