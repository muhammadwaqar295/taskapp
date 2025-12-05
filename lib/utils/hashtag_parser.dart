class HashtagParser {
  // Matches words that start with # and have letters, numbers or underscores
  static final RegExp hashtagRegex = RegExp(r'\B#\w+');

  static List<String> extractHashtags(String text) {
    if (text.isEmpty) return [];
    final matches = hashtagRegex.allMatches(text);
    return matches.map((m) => m.group(0)!).toList();
  }
}
