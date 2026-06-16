use std::collections::hash_map::Iter;

#[derive(Debug)]
pub enum Category {
    Ones,
    Twos,
    Threes,
    Fours,
    Fives,
    Sixes,
    FullHouse,
    FourOfAKind,
    LittleStraight,
    BigStraight,
    Choice,
    Yacht,
}

type Dice = [u8; 5];

pub fn score(dice: Dice, category: Category) -> u8 {

    let mut sorted = dice.to_vec();
    sorted.sort();

    match category {
        Category::Ones => return dice.iter().filter(|&d| *d == 1).sum(),
        Category::Twos => return dice.iter().filter(|&d| *d == 2).sum(),
        Category::Threes => return dice.iter().filter(|&d| *d == 3).sum(),
        Category::Fours => return dice.iter().filter(|&d| *d == 4).sum(),
        Category::Fives => return dice.iter().filter(|&d| *d == 5).sum(),
        Category::Sixes => return dice.iter().filter(|&d| *d == 6).sum(),

        Category::Yacht =>
            if dice.iter().all(|&d| d == dice[0]) {
                return 50
            },

        Category::FullHouse =>  
            if sorted[0] != sorted[4] &&
                sorted[0] == sorted[1] &&
                sorted[3] == sorted[4] &&
                (sorted[2] == sorted[1] || sorted[2] == sorted[3]) {

                return dice.iter().sum();
            },

        Category::FourOfAKind =>
            if sorted.iter().filter(|&d| *d == sorted[2] ).count() >= 4 {
                return 4 * sorted[2];
            },

        Category::LittleStraight => 
            if sorted == [1,2,3,4,5] {
                return 30;
            },

        Category::BigStraight =>
            if sorted == [2,3,4,5,6] {
                return 30;
            },

        Category::Choice => return dice.iter().sum(),
    }

    return 0;
}
