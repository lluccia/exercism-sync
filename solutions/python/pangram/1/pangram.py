def is_pangram(sentence):
    distinct_chars=list(set(sentence.lower()))
    sorted_chars=sorted(distinct_chars)
    letters = ''.join([c for c in sorted_chars if c.isalpha()])
    return letters == "abcdefghijklmnopqrstuvwxyz"
