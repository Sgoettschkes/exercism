import gleam/string

pub fn message(log_line: String) -> String {
  case log_line {
    "[ERROR]:" <> message -> string.trim(message)
    "[WARNING]:" <> message -> string.trim(message)
    "[INFO]:" <> message -> string.trim(message)
    _ -> ""
  }
}

pub fn log_level(log_line: String) -> String {
  case log_line {
    "[ERROR]:" <> _message -> "error"
    "[WARNING]:" <> _message -> "warning"
    "[INFO]:" <> _message -> "info"
    _ -> ""
  }
}

pub fn reformat(log_line: String) -> String {
  case log_line {
    "[ERROR]:" <> message -> string.trim(message) <> " (error)"
    "[WARNING]:" <> message -> string.trim(message) <> " (warning)"
    "[INFO]:" <> message -> string.trim(message) <> " (info)"
    _ -> ""
  }
}
