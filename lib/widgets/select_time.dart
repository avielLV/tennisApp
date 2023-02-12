import 'package:flutter/material.dart';
import 'package:tennisapp/provider/provider.dart';
import 'package:time_range/time_range.dart';

class SelectTime extends StatelessWidget {
  const SelectTime({
    super.key,
    required this.reservaformProvider,
  });

  final ReserveFormProvider reservaformProvider;

  @override
  Widget build(BuildContext context) {
    return TimeRange(
      fromTitle: const Text(
        'Desde',
        style: TextStyle(fontSize: 18, color: Colors.grey),
      ),
      toTitle: const Text(
        'Hasta',
        style: TextStyle(fontSize: 18, color: Colors.grey),
      ),
      titlePadding: 20,
      textStyle:
          const TextStyle(fontWeight: FontWeight.normal, color: Colors.black87),
      activeTextStyle:
          const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      borderColor: Colors.black,
      backgroundColor: Colors.transparent,
      activeBackgroundColor: Colors.deepPurple,
      firstTime: const TimeOfDay(hour: 8, minute: 00),
      lastTime: const TimeOfDay(hour: 20, minute: 00),
      timeStep: 60,
      timeBlock: 60,
      activeBorderColor: Colors.black,
      onRangeCompleted: (range) {
        reservaformProvider.randoTime =
            range ?? TimeRangeResult(TimeOfDay.now(), TimeOfDay.now());
      },
    );
  }
}
