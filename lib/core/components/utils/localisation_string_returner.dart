class LocalisationController {
  static LocalisationController _instace = LocalisationController._init();
  static LocalisationController get instance => _instace;
  LocalisationController._init();

  String getLanguage(String language) {
    if (languagesSupported.contains(language)) {
      return language;
    } else {
      return baseLanguage;
    }
  }

  final List<String> languagesSupported = ["en_US", "tr_TR"];
  final String baseLanguage = "en_US";
}
