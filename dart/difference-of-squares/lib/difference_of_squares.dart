import "dart:math";

class DifferenceOfSquares {
  int squareOfSum(int num) {
    var list = [for (int i = 1; i <= num; i += 1) i];
    int sum = list.fold(0, (prev, element) => prev + element);
    return pow(sum, 2).toInt();
  }

  int sumOfSquares(int num) {
    var list = [for (int i = 1; i <= num; i += 1) i];
    return list.fold(0, (prev, element) => prev + pow(element, 2).toInt());
  }

  int differenceOfSquares(int num) {
    return squareOfSum(num) - sumOfSquares(num);
  }
}
