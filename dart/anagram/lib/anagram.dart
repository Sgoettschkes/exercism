class Anagram {

  String sortWord(String word) {
      List<String> wordParts = word.split('');
      wordParts.sort();
      return wordParts.join('');
  }

  bool filter(String initialWord, String word) {
      if (initialWord == word) {
        return false;
      }
      return sortWord(initialWord) == sortWord(word);
  }

  List<String> findAnagrams(String word, List<String> words) {
    word = word.toLowerCase();
    return words.where((w) => filter(word, w.toLowerCase())).toList();
  }
}
