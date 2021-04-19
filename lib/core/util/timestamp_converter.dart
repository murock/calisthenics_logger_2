DateTime getDateTimeFromUnix(int unixTime) {
  int unixTimeInMilliseconds = unixTime * 1000;
  DateTime dateTime =
      DateTime.fromMillisecondsSinceEpoch(unixTimeInMilliseconds);
  DateTime roundedDate =
      new DateTime(dateTime.year, dateTime.month, dateTime.day);
  return roundedDate;
}

int getUnixTimeFromDateTime(DateTime dateTime) {
  return (dateTime.millisecondsSinceEpoch / 1000).round();
}
