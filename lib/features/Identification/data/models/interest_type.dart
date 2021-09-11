enum InterestType { SPORTS, ONLINEGAMES, LANGUAGES, PETS }

Map<InterestType, String> interestTypeBackendCodes = {
  InterestType.SPORTS: 'sports',
  InterestType.ONLINEGAMES: 'onlinegames',
  InterestType.LANGUAGES: 'languages',
  InterestType.PETS: 'pets'
};

InterestType intToInterestType(int index) {
  switch (index) {
    case 0:
      return InterestType.SPORTS;
    case 1:
      return InterestType.ONLINEGAMES;
    case 2:
      return InterestType.LANGUAGES;
    case 3:
      return InterestType.PETS;
    default:
      return InterestType.SPORTS;
  }
}
