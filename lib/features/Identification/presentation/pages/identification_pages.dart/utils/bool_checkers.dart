bool shouldGoNextField(int field, String value) {
  print('HERE IS THE VALUE ' + value);
  switch (field) {
    case 0:
      return kontrolForZero(int.parse(value));
    case 1:
      return kontrolForSecond(int.parse(value));
    case 2:
      return kontrolForThird(int.parse(value));
    default:
      return true;
  }
}

bool kontrolForZero(int value) {
  print('evet geçebiliriz');
  return value <= 31;
}

bool kontrolForSecond(int value) {
  print('evet geçebiliriz2');
  return value <= 12;
}

bool kontrolForThird(int value) {
  return value < 2010 && value > 1910;
}
