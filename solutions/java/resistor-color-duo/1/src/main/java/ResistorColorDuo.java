class ResistorColorDuo {

    int value(String[] colors) {
        return colorValue(colors[0]) * 10 +
               colorValue(colors[1]);
    }

    int colorValue(String color) {
        return ResistorColors.valueOf(color).ordinal();
    }
}
