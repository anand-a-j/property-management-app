enum DevelopmentType {
  apartmentBuilding,
  residentialCommunity,
  villaCommunity,
  mixedUse,
  commercialBuilding,
}

extension DevelopmentTypeX on DevelopmentType {
  String get value {
    switch (this) {
      case DevelopmentType.apartmentBuilding:
        return 'apartment_building';
      case DevelopmentType.residentialCommunity:
        return 'residential_community';
      case DevelopmentType.villaCommunity:
        return 'villa_community';
      case DevelopmentType.mixedUse:
        return 'mixed_use';
      case DevelopmentType.commercialBuilding:
        return 'commercial_building';
    }
  }

  String get label {
    switch (this) {
      case DevelopmentType.apartmentBuilding:
        return 'Apartment Building';
      case DevelopmentType.residentialCommunity:
        return 'Residential Community';
      case DevelopmentType.villaCommunity:
        return 'Villa Community';
      case DevelopmentType.mixedUse:
        return 'Mixed-Use Property';
      case DevelopmentType.commercialBuilding:
        return 'Commercial Building';
    }
  }
}
