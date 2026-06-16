def is_paired(input_string):
    brackets = []

    mapping = {
        '(': ')',
        '[': ']',
        '{': '}',
    }
    
    for char in input_string:
        if char in ['[', '{', '(']:
            brackets.append(char)
        elif char in [']', '}', ')']:
            if not brackets:
                return False

            last_open = brackets.pop()
            if char != mapping[last_open]:
                return False

    return brackets == []


