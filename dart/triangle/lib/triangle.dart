class Triangle {
  bool equilateral(double a, double b, double c) {
    return isTriangle(a, b, c) && a == b && b == c;
  }

  bool isosceles(double a, double b, double c) {
    return isTriangle(a, b, c) && (a == b || b == c || c == a);
  }

  bool scalene(double a, double b, double c) {
    return isTriangle(a, b, c) && a != b && b != c && c != a;
  }

  bool isTriangle(double a, double b, double c) {
    return a != 0 && b != 0 && c != 0 && (a + b >= c) && (b + c >= a) && (c + a >= b);
  }
}
