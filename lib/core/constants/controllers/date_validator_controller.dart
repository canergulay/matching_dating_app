class DateValidatorRegexper {
  static final RegExp dayRegexp = RegExp("[0-9]");

  static final RegExp monthRegexpFirst = RegExp("[0-1]");
  static final RegExp monthRegexpSecond = RegExp("[1-9]");

  static final RegExp yearRegexpFirst = RegExp("[1-2]");
  static final RegExp yearRegexpSecond = RegExp("[9]|[0]");
  static final RegExp yearRegexpLastTwo = RegExp("[0-9]");
}
