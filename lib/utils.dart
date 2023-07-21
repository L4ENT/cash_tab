extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

double closestTo(double a, double b, double c) {
  double diffToB = (a - b).abs();
  double diffToC = (a - c).abs();

  if (diffToB < diffToC) {
    return b;
  } else if (diffToC < diffToB) {
    return c;
  } else {
    // If the differences are equal, you can handle this case based on your requirements.
    // For simplicity, I'll return 'b' in this case.
    return b;
  }
}
