def is_lowercase_letter: . >= 97 and . <= 122;

.sentence 
| ascii_downcase
| explode 
| [ .[] | select(is_lowercase_letter) ]
| unique 
| implode
| . == "abcdefghijklmnopqrstuvwxyz"

