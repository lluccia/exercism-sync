def letters($word):
  $word | split("") | sort;

def is_anagram($subject; $candidate):
  if $subject == $candidate then
    false
  else
    letters($subject) == letters($candidate)
  end;

def anagrams($subject; $candidates):
  [ 
    $candidates[] 
    | select(is_anagram($subject | ascii_downcase; . | ascii_downcase))
  ];

anagrams(.subject; .candidates)
