class BeerSong {
  List<String> recite(int bottleCount, int iterations) {
    List<String> result = [];
    for (var i = 0; i < iterations; i++) {
      result.addAll([firstLine(bottleCount), secondLine(bottleCount), ""]);
      bottleCount--;
    }

    result.removeLast();

    return result;
  }

  String firstLine(int bottleCount) {
    if (bottleCount == 1) {
      return "1 bottle of beer on the wall, 1 bottle of beer.";
    }
    if (bottleCount == 0) {
      return "No more bottles of beer on the wall, no more bottles of beer.";
    }
    return "${bottleCount} bottles of beer on the wall, ${bottleCount} bottles of beer.";
  }

  String secondLine(int bottleCount) {
    if (bottleCount == 2) {
      return "Take one down and pass it around, 1 bottle of beer on the wall.";
    }
    if (bottleCount == 1) {
      return "Take it down and pass it around, no more bottles of beer on the wall.";
    }
    if (bottleCount == 0) {
      return "Go to the store and buy some more, 99 bottles of beer on the wall.";
    }
    return "Take one down and pass it around, ${bottleCount - 1} bottles of beer on the wall.";
  }
}
