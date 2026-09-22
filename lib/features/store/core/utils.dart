String slugToStoreName(String slug) {
  if (slug.isEmpty) return "";

  // Step 1: remove hyphens/underscores
  String cleaned = slug.replaceAll(RegExp(r'[-_]'), ' ');

  // Step 2: remove long random numbers (like IDs)
  cleaned = cleaned.replaceAll(RegExp(r'\d{5,}'), '');

  // Step 3: split camelCase & numbers
  cleaned = cleaned.replaceAllMapped(
    RegExp(r'([a-z])([A-Z])'),
    (match) => '${match.group(1)} ${match.group(2)}',
  );

  cleaned = cleaned.replaceAllMapped(
    RegExp(r'([a-zA-Z])(\d)'),
    (match) => '${match.group(1)} ${match.group(2)}',
  );

  cleaned = cleaned.replaceAllMapped(
    RegExp(r'(\d)([a-zA-Z])'),
    (match) => '${match.group(1)} ${match.group(2)}',
  );

  // Step 4: normalize spaces
  cleaned = cleaned.replaceAll(RegExp(r'\s+'), ' ').trim();

  // Step 5: capitalize each word
  final words = cleaned.split(' ');
  final result = words
      .map((word) {
        if (word.isEmpty) return word;
        return word[0].toUpperCase() + word.substring(1).toLowerCase();
      })
      .join(' ');

  return result;
}
