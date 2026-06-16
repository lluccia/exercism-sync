module RnaTranscription exposing (toRNA)

import Regex

nucleotideMap: Char -> Char
nucleotideMap n =
    case n of
        'G' -> 'C'
        'C' -> 'G'
        'T' -> 'A'
        'A' -> 'U'
        _ -> n

validNucleotides : Regex.Regex
validNucleotides =
    Maybe.withDefault Regex.never <|
    Regex.fromString "^[CGTA]+$"
        
toRNA : String -> Result String String
toRNA dna =
    if Regex.contains validNucleotides dna then
        Ok (String.map nucleotideMap dna)
    else
        Err "Invalid input"
