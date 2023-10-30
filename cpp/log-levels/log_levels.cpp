#include <string>

namespace log_line {
  std::string message(std::string msg) {
    int end = msg.find("]: ");
    return msg.substr(end + 3);
  }

  std::string log_level(std::string msg) {
    int begin = msg.find("[");
    int end = msg.find("]");

    return msg.substr(begin + 1, end - 1);
  }

  std::string reformat(std::string msg) {
    return message(msg) + " (" + log_level(msg) + ")";
  }
}
