pub type Error {
  NonPositiveNumber
}

pub fn steps(number: Int) -> Result(Int, Error) {
  case number {
    num if num < 1 -> Error(NonPositiveNumber)
    num -> Ok(collatz(num, 0))
  }
}

fn collatz(number: Int, steps) {
  case number, number % 2 {
    1, _ -> steps
    _, 0 -> collatz(number / 2, steps + 1)
    _, 1 -> collatz(3 * number + 1, steps + 1)
  }
}
