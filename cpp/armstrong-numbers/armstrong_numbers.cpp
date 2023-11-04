#include "armstrong_numbers.h"

namespace armstrong_numbers {
  bool is_armstrong_number(int num) {

    int numDigits = armstrong_numbers::numberDigits(num);
    int result = 0;
    int tmpNum = num;
    while (tmpNum) {
        int curNum = tmpNum % 10;   
        result += pow(curNum, numDigits);
        tmpNum /= 10;
    }

    return result == num;
  }

  int numberDigits(int number) {
    int digits = 0;
    if (number < 0) digits = 1; // remove this line if '-' counts as a digit
    while (number) {
        number /= 10;
        digits++;
    }
    return digits;
  }
}
