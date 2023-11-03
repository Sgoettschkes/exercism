import gleam/list

pub fn sum(factors factors: List(Int), limit limit: Int) -> Int {
  factors
  |> list.filter(fn(num) { num > 0 })
  |> list.map(fn(factor) { multiples(factor, factor, limit) })
  |> list.flatten()
  |> list.unique()
  |> list.fold(0, fn(num, acc) { num + acc })
}

fn multiples(num: Int, cur: Int, limit: Int) -> List(Int) {
  case cur >= limit {
    True -> []
    False -> [cur, ..multiples(num, cur + num, limit)]
  }
}
