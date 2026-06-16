use std::collections::HashSet;

pub fn check(candidate: &str) -> bool {

    let mut letters: HashSet<char> = HashSet::new();

    for c in candidate.chars() {
        if !c.is_alphabetic() { continue; }

        if !letters.insert(c.to_ascii_lowercase()) { return false }
    }

    return true;
}
