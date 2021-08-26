bool shouldGoNextField(int field, String value) {
  print('HERE IS THE VALUE ' + value);
  switch (field) {
    case 0:
      return kontrolForZero(int.parse(value));
    case 2:
      return kontrolForSecond(int.parse(value));
    case 3:
      return kontrolForThird(int.parse(value));
    case 4:
      return kontrolForForth(int.parse(value));
    case 5:
      return kontrolForFifth(int.parse(value));
    default:
      return true;
  }
}

bool kontrolForZero(int value) {
  return value <= 3;
}

bool kontrolForSecond(int value) {
  return value == 0 || value == 1;
}

bool kontrolForThird(int value) {
  return value < 3;
}

bool kontrolForForth(int value) {
  return value == 1 || value == 2;
}

bool kontrolForFifth(int value) {
  return value == 8 || value == 9 || value == 0;
}
