class SqueakyClean {
    static String clean(String identifier) {
        StringBuilder sb = new StringBuilder();
        boolean uppercaseNext = false;
        for (char c : identifier.toCharArray()) {
            if (c == '-') {
                uppercaseNext = true;
                continue;
            }

            if (Character.isISOControl(c)) {
                sb.append("CTRL");
                continue;
            }

            if (Character.isWhitespace(c)) {
                c = '_';
                sb.append(c);
                continue;
            }

            if (isLowerCaseGreekLetter(c)) continue;

            if (!Character.isLetter(c)) continue;

            if (uppercaseNext) {
                c = Character.toUpperCase(c);
                uppercaseNext = false;
            }

            sb.append(c);
        }
        return sb.toString();
    }

    private static boolean isLowerCaseGreekLetter(char c) {
        return c >= 'α' && c <= 'ω';
    }
}
