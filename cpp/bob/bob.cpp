#include "bob.h"
#include <string>

namespace bob {
  std::string hey(std::string msg) {
    msg.erase(msg.find_last_not_of(" \n\r\t")+1);
    msg.erase(0, msg.find_first_not_of(" \n\r\t"));

    if(msg.length() == 0) {
      return "Fine. Be that way!";
    }

    if (has_alpha(msg) && to_upper(msg) == msg) {
      if (msg[msg.length() - 1] == '?') {
        return "Calm down, I know what I'm doing!";
      }
      return "Whoa, chill out!";
    }

    if (msg[msg.length() - 1] == '?') {
      return "Sure.";
    }

    return "Whatever.";
  }

  std::string to_upper(std::string str) {
    std::string result{""};
    for (int x=0; x < (int) str.length(); x++) {
      result += std::toupper(str[x]);
    }

    return result;
  }

  bool has_alpha(std::string str) {
    for (int x=0; x < (int) str.length(); x++) {
      if (isalpha(str[x])) { return true; }
    }
    return false;
  }
}
