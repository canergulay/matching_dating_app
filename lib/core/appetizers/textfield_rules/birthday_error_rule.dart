import 'package:matchangoo/core/appetizers/customtypes/bool_returnerW_text_parameter.dart';

bool shouldGoNextField(int field, String value) {
  print('HERE IS THE VALUE ' + value);
  switch (field) {
    case 0:
      return kontrolForFirst(value);
    case 1:
      return kontrolForSecond(value);
    case 2:
      return kontrolForThird(value);
    default:
      return true;
  }
}

bool kontrolForFirst(String value) {
  if (value.length > 0) {
    return int.parse(value) <= 31 && value.length > 1;
  }
  return false;
}

bool kontrolForSecond(String value) {
  if (value.length > 0) {
    return int.parse(value) <= 12 && value.length > 1;
  }
  return false;
}

bool kontrolForThird(String value) {
  if (value.length > 0) {
    return int.parse(value) < 2010 && int.parse(value) > 1910;
  }
  return false;
}

List<BoolReturnerWithTextParameter> boolReturnes = [kontrolForFirst, kontrolForSecond, kontrolForThird];
