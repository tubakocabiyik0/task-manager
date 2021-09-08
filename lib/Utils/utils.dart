import 'package:intl/intl.dart';

class Utils {
  static toDate(DateTime dateTime) {
    final date = DateFormat.yMMMEd().format(dateTime);
    return '$date';
  }
}
