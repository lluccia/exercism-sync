import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;
import java.util.stream.Stream;

class ParallelLetterFrequency {

    private final String[] texts;

    ParallelLetterFrequency(String[] texts) {
        this.texts = texts;
    }

    Map<Character, Integer> countLetters() {
        return Stream.of(texts).parallel()
                .flatMap(s -> s.chars().mapToObj(c -> (char) c))
                .filter(Character::isLetter)
                .map(Character::toLowerCase)
                .collect(Collectors.toMap(
                        Function.identity(),
                        c -> 1,
                        Integer::sum
                ));
    }
}
