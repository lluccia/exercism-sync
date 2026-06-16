export function valid(digitString: string): boolean {
    if (!digitString.match('^(\\d| )+$')) return false

    let digits = digitString.split('').filter(d => d.match('\\d')).map(Number).reverse()
    if (digits.length < 2) return false

    for (let i = 0; i < digits.length; i++) {
        if (i % 2 != 0) {
            digits[i] = digits[i] * 2

            if (digits[i] > 9) digits[i] = digits[i] - 9
        }
    }
    let sum = digits.reduce((acc, curr) => acc + curr, 0)

    return sum % 10 === 0
}
