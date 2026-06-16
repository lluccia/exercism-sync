export function toRna(dna: string) {
    const nucleotides = [...dna];
    return nucleotides.map(nucleotide => complementOf(nucleotide)).join("");
}

function complementOf(dna: string) {
    switch (dna) {
        case "C":
            return "G";
        case "G":
            return "C";
        case "A":
            return "U";
        case "T":
            return "A";

        default:
            throw new Error('Invalid input DNA.');
    }
}
