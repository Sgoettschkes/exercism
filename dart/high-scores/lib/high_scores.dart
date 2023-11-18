class HighScores {
  List<int> scores = [];

  HighScores(this.scores);

  int latest() {
    return this.scores.last;
  }

  int personalBest() {
    var localScores = scores.toList()..sort();
    
    return localScores.last;
  }

  List<int> personalTopThree() {
    var localScores = scores.toList()..sort();

    return localScores.reversed.toList().take(3).toList();
  }
}
