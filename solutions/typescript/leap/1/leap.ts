export function isLeap(year: number) {
  return isDivisibleBy(year, 4) && (!isDivisibleBy(year, 100) || isDivisibleBy(year, 400));
}

function isDivisibleBy(dividend:number, divisor:number) {
  return dividend % divisor == 0;
}
