class PhoneNumber {
  String clean(String number) {
    String cleaned = number.replaceAll(RegExp('[ \-\.]'), '');

    if (cleaned.contains(RegExp('[A-Za-z]'))) {
      throw FormatException('letters not permitted');
    }
    if (cleaned.contains(RegExp('[^0-9]'))) {
      throw FormatException('punctuations not permitted');
    }
    if (cleaned.length < 10) {
      throw FormatException('must not be fewer than 10 digits');
    }
    if (cleaned.length > 11) {
      throw FormatException('must not be greater than 11 digits');
    }
    if (cleaned.length == 11 && cleaned[0] != '1') {
      throw FormatException('11 digits must start with 1');
    }
    if (cleaned.length == 11) {
      cleaned = cleaned.substring(1);
    }
    if(cleaned[0] == '0') {
      throw FormatException('area code cannot start with zero');
    }
    if(cleaned[0] == '1') {
      throw FormatException('area code cannot start with one');
    }
    if(cleaned[3] == '0') {
      throw FormatException('exchange code cannot start with zero');
    }
    if(cleaned[3] == '1') {
      throw FormatException('exchange code cannot start with one');
    }
    return cleaned;
  }
}
