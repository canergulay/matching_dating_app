import '../../components/buttons/animated_button.dart';

class DateValidatorRegexper {
  static final RegExp dayRegFirst = RegExp("[0-3]");

  static final RegExp dayRegexpSecond = RegExp("[0-9]");

  static final RegExp monthRegexpFirst = RegExp("[0-1]");
  static final RegExp monthRegexpSecond = RegExp("[1-9]");

  static final RegExp yearRegexpFirst = RegExp("[1-2]");
  static final String _dummy = "";
  static final RegExp yearRegexpSecond = RegExp("((^|, )([8-9]|[0-0]|0))+$_dummy");
  static final RegExp yearRegexpLastTwo = RegExp("[0-9]");
}
