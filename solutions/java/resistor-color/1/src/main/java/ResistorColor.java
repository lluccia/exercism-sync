import java.util.stream.Stream;

class ResistorColor {

    static final String[] colors = { "black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white" };

    int colorCode(String color) {
        for (int value = 0; value < 10; value++)
            if (colors()[value].equals(color))
                return value;
        
        return -1;
    }

    String[] colors() {
        return colors;
    }
}
