import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  DateTime _date = DateTime(2000);
  DateTime get date => _date;
  set date(DateTime value) {
    _date = value;
    notifyListeners();
  }

  int _cancha = 0;
  int get cancha => _cancha;
  set cancha(int value) {
    _cancha = value;
    notifyListeners();
  }

  String _pop = '';
  String get pop => _pop;
  set pop(String value) {
    _pop = value;
    notifyListeners();
  }
}
