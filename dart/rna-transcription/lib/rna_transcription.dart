class RnaTranscription {
  String toRna(String dna) {
    List<String> dnaParts = dna.split('');
    List<String> rnaParts = dnaParts.map((d) => transcribe(d)).toList();
    return rnaParts.join('');
  }

  String transcribe(String d) {
    switch (d) {
      case 'G':
        return 'C';
        break;
      case 'C': 
        return 'G';
        break;
      case 'T': 
        return 'A';
        break;
      case 'A': 
        return 'U';
        break;
    }
    return '';
  }
}
