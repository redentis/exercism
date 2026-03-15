use std::collections::HashSet;

fn sort_chars(word: &str) -> String {
    let mut word_chars: Vec<char> = word.chars().collect();
    word_chars.sort();
    word_chars.iter().collect()
}

pub fn anagrams_for<'a>(word: &str, possible_anagrams: &[&'a str]) -> HashSet<&'a str> {
    let mut result = HashSet::new();
    let word_lower = word.to_lowercase();
    let word_sorted = sort_chars(&word_lower);
    
    for a in possible_anagrams {
        let a_lower = a.to_lowercase();
        if a_lower != word_lower {
            let a_sorted = sort_chars(&a_lower);
            if a_sorted == word_sorted {
                result.insert(*a);
            }
        }
    }

    result
}
