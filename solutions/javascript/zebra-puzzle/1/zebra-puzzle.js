export class ZebraPuzzle {
  constructor() {
    this.sol = solve().next().value;
  }
  waterDrinker() {
    return this.sol.nationality[this.sol.drinks.water];
  }
  zebraOwner() {
    return this.sol.nationality[this.sol.pets.zebra];
  }
}
function* solve() {
  for (const [red, green, ivory, yellow, blue] of perm5()) {
    if (green - ivory != 1) continue;  // 6.
     for (const [english, spain, ukraine, norway, japan] of perm5()) {
      if (norway != 0) continue;     // 10.
      if (english != red) continue;  // 2.
      for (const [dog, snail, fox, horse, zebra] of perm5()) {
        if (spain != dog) continue;  // 3.
        for (const [coffee, tea, milk, orange, water] of perm5()) {
          if (coffee != green) continue;  // 4.
          if (tea != ukraine) continue;   // 5.
          if (milk != 2) continue;        // 9.
          for (const [dancing, painter, reading, football, chess] of perm5())
          {
            if (dancing != snail) continue;               // 7.
            if (painter != yellow) continue;              // 8.
            if (Math.abs(reading - fox) != 1) continue;   // 11.
            if (Math.abs(painter - horse) != 1) continue; // 12.
            if (football != orange) continue;             // 13.
            if (chess != japan) continue;                 // 14.
            if (Math.abs(norway - blue) != 1) continue;   // 15.
            yield {
              nationality: Object.fromEntries([
                [english, "Englishman"],
                [spain, "Spaniard"],
                [ukraine, "Ukrainian"],
                [norway, "Norwegian"],
                [japan, "Japanese"],
              ]),
              colors: {red, green, ivory, yellow, blue},
              pets: {dog, snail, fox, horse, zebra},
              drinks: {coffee, tea, milk, orange, water},
              hobby: {dancing, painter, reading, football, chess},
            };
          }
        }
      }
    }
  }
}

function* perm5() {
  yield* permutations([0, 1, 2, 3, 4])
}
function* permutations(vals) {
  if (vals.length <= 1) {
    yield vals;
  } else {
    for (const i in vals) {
      [vals[0], vals[i]] = [vals[i], vals[0]];
      for (const p of permutations(vals.slice(1)))
        yield [vals[0], ...p];
      [vals[0], vals[i]] = [vals[i], vals[0]];
    }
  }
}