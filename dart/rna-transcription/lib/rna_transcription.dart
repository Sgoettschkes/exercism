class RnaTranscription {
  String toRna(String dna) {
    List<String> dnaParts = dna.split('');
    List<String> rnaParts = dnaParts.map((d) => transcribe(d)).toList();
    return rnaParts.join('');
  }

  String transcribe(String d) {
    String res = '';
    switch (d) {
      case 'G':
        res = 'C';
        break;
      case 'C': 
        res = 'G';
        break;
      case 'T': 
        res = 'A';
        break;
      case 'A': 
        res = 'U';
        break;
    }
    return res;
  }
}
