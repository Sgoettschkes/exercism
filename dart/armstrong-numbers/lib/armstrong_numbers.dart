import "dart:math";

class ArmstrongNumbers {
  bool isArmstrongNumber(int number) {
    var numberParts = number.toString().split('');
    return number ==
        numberParts.fold(
            0,
            (num prev, elem) =>
                prev + pow(int.parse(elem), numberParts.length));
  }
}
