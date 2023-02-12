import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tennisapp/helpers/helpers.dart';
import 'package:tennisapp/provider/provider.dart';
import 'package:tennisapp/services/services.dart';

class SelectDate extends StatelessWidget {
  const SelectDate({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    final homeService = Provider.of<HomeService>(context);
    return DatePicker(
      DateTime.now(),
      height: 100,
      width: 80,
      daysCount: 16,
      // initialSelectedDate: DateTime.now(),
      selectionColor: Colors.deepPurple,
      selectedTextColor: Colors.white,
      dateTextStyle: const TextStyle(
          fontSize: 22, fontWeight: FontWeight.w500, color: Colors.grey),
      dayTextStyle: const TextStyle(
          fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey),
      monthTextStyle: const TextStyle(
          fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey),
      locale: 'es_ES',
      onDateChange: (selectedDate) async {
        homeProvider.date = selectedDate;
        await homeService.cargarReserva(
            homeProvider.date.format, homeProvider.cancha);
      },
    );
  }
}
