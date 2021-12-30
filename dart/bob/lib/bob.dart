class Bob {
  String response(String request) {
    request = request.trim();
    
    if (request.isEmpty) {
      return 'Fine. Be that way!';
    }
    if (request.contains(RegExp(r'[a-zA-Z]+')) && request.toUpperCase() == request) {
      if (request.contains('?')) {
        return 'Calm down, I know what I\'m doing!';
      }
      return 'Whoa, chill out!';
    }
    if (request.contains(RegExp(r'.*\?$'))) {
      return 'Sure.';
    }
    return 'Whatever.';
  }
}
