def letters_only:
    gsub("[^a-zA-Z]";"");

def letters_count: 
     . / ""
    | group_by(.)
    | map(length);

def repeated_letters:
    [ .[] | select(. > 1) ];

.phrase 
| letters_only
| ascii_downcase
| letters_count
| repeated_letters
| length == 0

