class AppConstants {
  static const String CHECK_ON_BOARD = "CHECK_ON_BOARD";
  static bool validateDate(String date) {
    //dd/MM/yyyy
    final reg2 = RegExp(r'''\b(0?[1-9]|[12][0-9]|3[01])\/(1|01|3|03|5|05|7|07|8|08|10|12)\/(19|20)?[0-9]{2}$\b''');
    final reg3 = RegExp(r'''\b(0?[1-9]|[12][0-9]|30)\/(4|04|6|06|9|09|11)\/(19|20)?[0-9]{2}$\b''');
    final reg4 = RegExp(r'''\b(0?[1-9]|[12]?[0-9])\/(2|02)\/(1952|1956|1960|1964|1968|1972|1976|1980|1984|1988|1992|1996|2000|2004|2008|2012|2016|2020|2024|2028|2032|2036|2040)$\b''');
    final reg5 = RegExp(r'''\b(0?[1-9]|[12]?[0-8]|19)\/(2|02)\/(19|20)?[0-9]{2}$\b''');
    if (reg2.hasMatch(date)||reg3.hasMatch(date)||reg4.hasMatch(date)||reg5.hasMatch(date)){
      return true;
    } else {
      return false;
    }
  }
  static bool validateTime(String time) {
    //dd/MM/yyyy HH:mm
    final reg2 = RegExp(r'''\b(0?[1-9]|[12][0-9]|3[01])\/(1|01|3|03|5|05|7|07|8|08|10|12)\/(19|20)?[0-9]{2} (2[0-3]|1[0-9]|0?[0-9])\:(0?[0-9]|[1-5][0-9])$\b''');
    final reg3 = RegExp(r'''\b(0?[1-9]|[12][0-9]|30)\/(4|04|6|06|9|09|11)\/(19|20)?[0-9]{2} (2[0-3]|1[0-9]|0?[0-9])\:(0?[0-9]|[1-5][0-9])$\b''');
    final reg4 = RegExp(r'''\b(0?[1-9]|[12]?[0-9])\/(2|02)\/(1952|1956|1960|1964|1968|1972|1976|1980|1984|1988|1992|1996|2000|2004|2008|2012|2016|2020|2024|2028|2032|2036|2040) (2[0-3]|1[0-9]|0?[0-9])\:(0?[0-9]|[1-5][0-9])$\b''');
    final reg5 = RegExp(r'''\b(0?[1-9]|[12]?[0-8]|19)\/(2|02)\/(19|20)?[0-9]{2} (2[0-3]|1[0-9]|0?[0-9])\:(0?[0-9]|[1-5][0-9])$\b''');
    if (reg2.hasMatch(time)||reg3.hasMatch(time)||reg4.hasMatch(time)||reg5.hasMatch(time)){
      return true;
    } else {
      return false;
    }
  }
}