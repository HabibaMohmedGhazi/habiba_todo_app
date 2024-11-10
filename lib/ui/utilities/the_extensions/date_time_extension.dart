extension TimeExtensions on DateTime {
  String get toFormatedDate {
    return '$day / $month / $year ';
  }

  String get dayName {
    List<String> theDayNameList = [
      'sat',
      'sun',
      'mon',
      'tues',
      'wed',
      'thurs',
      'fri'
    ];
    return theDayNameList[weekday];
  }
}
