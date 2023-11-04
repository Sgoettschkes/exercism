#include "reverse_string.h"

namespace reverse_string {
  std::string reverse_string(std::string str) {
    std::string result{""};
    for (int i = 0; i < (int) str.length(); i++) {
      result += str[str.length() - 1 - i];
    }
    return result;
  }
}  // namespace reverse_string
