import gleam/list as lst

pub fn append(first first: List(a), second second: List(a)) -> List(a) {
    lst.append(first, second)
}

pub fn concat(lists: List(List(a))) -> List(a) {
    lst.concat(lists)
}

pub fn filter(list: List(a), function: fn(a) -> Bool) -> List(a) {
    lst.filter(list, function)
}

pub fn length(list: List(a)) -> Int {
    lst.length(list)
}

pub fn map(list: List(a), function: fn(a) -> b) -> List(b) {
    lst.map(list, function)
}

pub fn foldl(
  over list: List(a),
  from initial: b,
  with function: fn(b, a) -> b,
) -> b {
    lst.fold(list, initial, function)
}

pub fn foldr(
  over list: List(a),
  from initial: b,
  with function: fn(b, a) -> b,
) -> b {
    lst.fold_right(list, initial, function)
}

pub fn reverse(list: List(a)) -> List(a) {
    lst.reverse(list)
}
