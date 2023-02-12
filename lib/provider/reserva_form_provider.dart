import 'package:flutter/material.dart';
import 'package:time_range/time_range.dart';

class ReserveFormProvider extends ChangeNotifier {
  DateTime dateTime = DateTime(2000);

  String _pop = '';
  String get pop => _pop;
  set pop(String value) {
    _pop = value;
    notifyListeners();
  }

  String nombre = '';
  int valorCancha = 0;
  TimeRangeResult randoTime = TimeRangeResult(TimeOfDay.now(), TimeOfDay.now());
}
