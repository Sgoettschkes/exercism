import gleam/list
import gleam/string

pub fn reverse(value: String) -> String {
  let res =
    value
    |> string.split("")
    |> list.reduce(fn(acc, x) { string.append(x, acc) })

  case res {
    Ok(result) -> result
    Error(Nil) -> ""
  }
}
