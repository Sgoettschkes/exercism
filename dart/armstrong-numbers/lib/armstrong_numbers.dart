import "dart:math";

class ArmstrongNumbers {
  bool isArmstrongNumber(int number) {
    var numberParts = number.toString().split('');
    var res = numberParts.fold(0, (num prev, elem) => prev + pow(int.tryParse(elem) ?? 0, numberParts.length));
    return res == number;
  }
}
