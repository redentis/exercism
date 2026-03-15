class Leap {
  bool leapYear(int year) {
    var result = false;
    if(year % 4 == 0) {
      if(year % 100 == 0) {
        if(year % 400 == 0) {
          result = true;
        }
      } else {
        result = true;
      }
    }
    return result;
  }
}
