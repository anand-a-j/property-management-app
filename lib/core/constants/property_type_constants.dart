class PropertyTypeConstants {
  PropertyTypeConstants._();

  /// Fixed community types
  static const List<String> communityTypes = [
    'Villa Community',
    'Townhouse Community',
    'Apartment Community',
    'Mixed-Use Property',
    'Commercial Building',
    'Residential Building',
  ];

  /// Fixed unit types mapped to their community types
  static const Map<String, List<String>> unitTypes = {
    'Villa Community': [
      '2-Bedroom Villa',
      '3-Bedroom Villa',
      '4-Bedroom Villa',
    ],
    'Townhouse Community': [
      '1-Bedroom Townhouse',
      '2-Bedroom Townhouse',
      '3-Bedroom Townhouse',
      '4-Bedroom Townhouse',
    ],
    'Apartment Community': [
      'Studio',
      '1-Bedroom Apartment',
      '2-Bedroom Apartment',
      '3-Bedroom Apartment',
    ],
    'Mixed-Use Property': ['Apartment', 'Villa', 'Retail Shop', 'Office'],
    'Commercial Building': ['Office', 'Retail Shop', 'Restaurant Space'],
    'Residential Building': [
      'Studio',
      '1-Bedroom Unit',
      '2-Bedroom Unit',
      '3-Bedroom Unit',
    ],
  };

  /// Returns unit types for the selected community type.
  static List<String> getUnitTypes(String? communityType) {
    return unitTypes[communityType] ?? [];
  }
}
