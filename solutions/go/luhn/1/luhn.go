package luhn

import (
	"regexp"
	"strings"
)

func Valid(s string) bool {
	containsOnlyDigitsOrSpaces, _ := regexp.MatchString("^(\\d| )+$", s)

	if !containsOnlyDigitsOrSpaces {
		return false
	}

	var digits string = strings.ReplaceAll(s, " ", "")

	if len(digits) <= 1 {
		return false
	}

	var sum uint = 0
	for idx, digit := range digits {
		d := runeToUint(digit)

		shouldDouble := (len(digits)-idx)%2 == 0

		if shouldDouble {
			d *= 2
			if d > 9 {
				d -= 9
			}
		}
		sum += d
	}
	return sum%10 == 0
}

func runeToUint(d rune) uint {
	return (uint(d) - '0')
}
