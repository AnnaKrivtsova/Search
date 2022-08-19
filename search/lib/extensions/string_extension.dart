import 'package:intl/intl.dart';

extension StringExtension on String {
  String formatQuery() {
    return endsWith(' ') ? this : replaceAll(RegExp(r' '), '+');
  }

  String formatDateTime() {
    final dateTime = DateTime.parse(this);
    String formattedDate = DateFormat('EE, dd MMM yyyy hh:mm a').format(dateTime);
    return formattedDate;
  }
}
