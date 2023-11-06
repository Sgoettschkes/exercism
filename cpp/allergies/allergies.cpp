#include "allergies.h"

#include <array>

namespace allergies {
  static const std::array<std::string, 8> all_allergies = {
    "eggs", "peanuts", "shellfish", "strawberries",
    "tomatoes", "chocolate", "pollen", "cats"
  };

  allergy_test::allergy_test(int score) {
    for (int i = 0; i < (int) all_allergies.size(); ++i) {
      if (score & (1 << i)) {
        allergies.insert(all_allergies[i]);
      }
    }
  }

  bool allergy_test::is_allergic_to(std::string item) {
    return allergies.find(item) != allergies.end();
  }

  std::unordered_set<std::string> allergy_test::get_allergies() {
    return allergies;
  }
}  // namespace allergies
