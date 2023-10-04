pub type Error {
  NonPositiveNumber
}

pub fn steps(number: Int) -> Result(Int, Error) {
  case number {
    num if num < 1 -> Error(NonPositiveNumber)
    num -> Ok(collatz(num))
  }
}

fn collatz(number: Int) {
  case number {
    1 -> 0
    num ->
      case num % 2 {
        0 -> 1 + collatz(num / 2)
        1 -> 1 + collatz(3 * num + 1)
      }
  }
}
