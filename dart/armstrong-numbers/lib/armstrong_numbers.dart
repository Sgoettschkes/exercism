import "dart:math";

class ArmstrongNumbers {
  bool isArmstrongNumber(String number) {
    var numberParts = number.split('');
    return int.parse(number) ==
        numberParts.fold(
            0,
            (num prev, elem) =>
                prev + pow(int.parse(elem), numberParts.length));
  }
}
