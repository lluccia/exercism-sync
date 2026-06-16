package scrabble

import "unicode"

func Score(word string) int {
	var score int = 0

	letters := []rune(word)

	for i := 0; i < len(letters); i++ {
		letter := letters[i]
		score += LetterPoints(letter)
	}

	return score
}

func LetterPoints(letter rune) int {
	switch unicode.ToUpper(letter) {
	case 'A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T':
		return 1
	case 'D', 'G':
		return 2
	case 'B', 'C', 'M', 'P':
		return 3
	case 'F', 'H', 'V', 'W', 'Y':
		return 4
	case 'K':
		return 5
	case 'J', 'X':
		return 8
	case 'Q', 'Z':
		return 10
	default:
		return 0
	}
}
