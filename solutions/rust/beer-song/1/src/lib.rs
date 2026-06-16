pub fn verse(n: u32) -> String {
    let first_line;
    let second_line;
    
    if n == 0 {
        first_line = "No more bottles of beer on the wall, no more bottles of beer.".to_string();
        second_line = "Go to the store and buy some more, 99 bottles of beer on the wall.".to_string();
    } else {
        first_line = format!("{bottles} of beer on the wall, {bottles} of beer.", bottles = bottles(n));
        second_line = format!("Take {} down and pass it around, {} of beer on the wall.", match n { 1 => "it", _=> "one" }, bottles(n-1));
    }

    return format!("{}\n{}\n", first_line, second_line);
}

fn bottles(n: u32) -> String {
    match n {
        0 => return "no more bottles".to_string(),
        1 => return format!("{} bottle", n),
        _ => return format!("{} bottles", n),
    }
}

pub fn sing(start: u32, end: u32) -> String {
    let mut song = String::new();

    for v in (end..start+1).rev() {
        song.push_str(&verse(v));
        
        if v > end {
            song.push_str("\n");
        }
    }

    return song;
}
