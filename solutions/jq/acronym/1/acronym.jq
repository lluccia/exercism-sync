.phrase 
| gsub("[^a-zA-Z -]"; "")
| split("[ -]"; null)
| [(.[] | explode | .[0] )]
| map(. // empty)
| implode 
| ascii_upcase
