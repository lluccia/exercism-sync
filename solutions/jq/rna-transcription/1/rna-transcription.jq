def toRna:
  { 
      "C": "G",
      "G": "C",
      "T": "A",
      "A": "U",
  } as $dna_to_rna |
  split("") | map($dna_to_rna[.]) | join("")
;
