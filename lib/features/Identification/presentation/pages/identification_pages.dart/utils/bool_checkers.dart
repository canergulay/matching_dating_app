bool shouldGoNextField(int field, String value) {
  print('HERE IS THE VALUE ' + value);
  switch (field) {
    case 0:
      return kontrolForZero(value);
    case 1:
      return kontrolForSecond(value);
    case 2:
      return kontrolForThird(value);
    default:
      return true;
  }
}

bool kontrolForZero(String value) {
  print('evet geçebiliriz');
  return int.parse(value) <= 31 && value.length > 1;
}

bool kontrolForSecond(String value) {
  print('evet geçebiliriz2');

  return int.parse(value) <= 12 && value.length > 1;
}

bool kontrolForThird(String value) {
  return int.parse(value) < 2010 && int.parse(value) > 1910;
}
