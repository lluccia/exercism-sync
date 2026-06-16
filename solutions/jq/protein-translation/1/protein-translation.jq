def protein_map:
    {
        "Methionine": ["AUG"],
        "Phenylalanine": ["UUU", "UUC"],
        "Leucine": ["UUA", "UUG"],
        "Serine": ["UCU", "UCC", "UCA", "UCG"],
        "Tyrosine": ["UAU", "UAC"],
        "Cysteine": ["UGU", "UGC"],
        "Tryptophan": ["UGG"],
        "STOP": ["UAA", "UAG", "UGA"]
    };

def translate:
    . as $codon | protein_map | to_entries 
    | map(select(.value[] == $codon)) 
    | if length > 0 then
          .[].key
      else
          "Invalid codon"
      end;

def split_codons:
    scan("[A-Z]{1,3}");


.strand | [ split_codons | translate ] | .[0:index("STOP")] as $proteins
| if "Invalid codon" | IN($proteins[]) then "Invalid codon" | halt_error else $proteins end
