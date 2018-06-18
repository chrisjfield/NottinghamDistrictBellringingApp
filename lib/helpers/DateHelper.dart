import 'package:intl/intl.dart';

class DateHelper {
  static String dateFromDateString(String date) {
    final DateTime parsedDate = DateTime.parse(date);

    return dateFromDateTime(parsedDate);
  }

  static String dateFromDateTime(DateTime date) {
    return DateFormat.MMMd().format(date);
  }

  static String timeFromDateString(String date) {
    final DateTime parsedDate = DateTime.parse(date);

    return timeFromDateTime(parsedDate);
  }

  static String timeFromDateTime(DateTime date) {
    return DateFormat.Hm().format(date);
  }
}
