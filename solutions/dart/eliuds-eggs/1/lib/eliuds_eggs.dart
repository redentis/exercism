class EggCounter {
  int count(int display) {
    int _ones = display.toRadixString(2).split('').where((e) => e == '1').length;
    return _ones;
  }
}
