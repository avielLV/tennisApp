import 'package:intl/intl.dart';

extension DateFormt on DateTime {
  String get format {
    return DateFormat('dd/MM/yyyy').format(this).toString();
  }
}
