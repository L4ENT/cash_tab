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

String formatNumberWithSpaces(String text) {
  // Splitting the number into whole and fractional parts
  List<String> parts = text.split(RegExp(r'[,.]'));

  // Format the whole number part
  String wholePart = parts[0].replaceAll(' ', '');
  List<String> wholeNumberParts = [];
  for (int i = wholePart.length; i > 0; i -= 3) {
    int startIndex = i - 3;
    if (startIndex < 0) startIndex = 0;
    wholeNumberParts.insert(0, wholePart.substring(startIndex, i));
  }
  String formattedWhole = wholeNumberParts.join(' ');

  // If there's a fractional part, append it as it is
  if (parts.length > 1) {
    return '$formattedWhole.${parts[1]}';
  } else {
    return formattedWhole;
  }
}

double safeParseDouble(String? input) {
  if (input == null) return 0.0;

  String cleanedInput = input.replaceAll(' ', '');

  try {
    return double.parse(cleanedInput);
  } catch (e) {
    return 0.0;
  }
}
