def is_pangram(sentence):
    distinct_chars=list(set(sentence.lower()))
    sorted_chars=sorted(distinct_chars)
    letters = "".join([char for char in sorted_chars if char.isalpha()])
    return letters == "abcdefghijklmnopqrstuvwxyz"
