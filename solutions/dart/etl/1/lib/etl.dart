class Etl {
  Map<String, int> transform(Map<String, List<String>> scorecard) {
    return {
      for(var entry in scorecard.entries)
        for(var v in entry.value)
          v.toLowerCase(): int.parse(entry.key)
    };
  }
}
