import gleam/list
import gleam/string

pub fn first_letter(name: String) {
  let first_letter =
    name
    |> string.trim()
    |> string.first()

  case first_letter {
    Ok(first_letter) -> first_letter
    _ -> ""
  }
}

pub fn initial(name: String) {
  name
  |> first_letter()
  |> string.uppercase()
  |> string.append(".")
}

pub fn initials(full_name: String) {
  let [first, last] = string.split(full_name, " ")
  initial(first) <> " " <> initial(last)
}

pub fn pair(full_name1: String, full_name2: String) {
  "
     ******       ******
   **      **   **      **
 **         ** **         **
**            *            **
**                         **
**     " <> initials(full_name1) <> "  +  " <> initials(full_name2) <> "     **
 **                       **
   **                   **
     **               **
       **           **
         **       **
           **   **
             ***
              *
"
}
