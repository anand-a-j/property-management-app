enum CommunityType {
  villa,
  apartment,
  townhouse,
  studio,
  penthouse,
  duplex,
  condominium,
}

extension CommunityTypeX on CommunityType {
  String get value {
    switch (this) {
      case CommunityType.villa:
        return 'villa';
      case CommunityType.apartment:
        return 'apartment';
      case CommunityType.townhouse:
        return 'townhouse';
      case CommunityType.studio:
        return 'studio';
      case CommunityType.penthouse:
        return 'penthouse';
      case CommunityType.duplex:
        return 'duplex';
      case CommunityType.condominium:
        return 'condominium';
    }
  }

  String get label {
    switch (this) {
      case CommunityType.villa:
        return 'Villa';
      case CommunityType.apartment:
        return 'apartment';
      case CommunityType.townhouse:
        return 'Townhouse';
      case CommunityType.studio:
        return 'Studio';
      case CommunityType.penthouse:
        return 'Penthouse';
      case CommunityType.duplex:
        return 'Duplex';
      case CommunityType.condominium:
        return 'Condominium';
    }
  }
}
