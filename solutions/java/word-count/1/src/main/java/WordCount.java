import java.util.HashMap;
import java.util.Map;
import java.util.StringTokenizer;

class WordCount {
    public Map<String, Integer> phrase(String input) {
        Map<String, Integer> wordCount = new HashMap<>();

        StringTokenizer st = new StringTokenizer(input, " ,\t\n\r\f.:!&#@$%^");

        while(st.hasMoreTokens()) {
            String word = sanitize(st.nextToken());

            if (!word.isEmpty())
                wordCount.merge(word, 1,Integer::sum);
        }

        return wordCount;
    }

    private String sanitize(String token) {
        return token.toLowerCase().replaceAll("^'|'$", "");
    }
}
