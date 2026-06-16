component {
	
	array function rows( letter ) {
		distanceToA = asc(letter) - asc("A");
		size = distanceToA + 1;
		
		diamond = [];

		for (i = 1; i <= size; i++) {
			currentLetter = chr(asc("A")-1 + i);

			line = repeatString(" ", size - i);
			line &= currentLetter;

			if (i > 1) {
				line &= repeatString(" ", 2*(i-1) - 1);
				line &= currentLetter;
			}

			line &= repeatString(" ", size - i);

			arrayAppend(diamond, line);
		}

		for (i = size - 1; i >= 1; i--) {
			arrayAppend(diamond, diamond[i]);
		}

		return diamond;
	}
	
}