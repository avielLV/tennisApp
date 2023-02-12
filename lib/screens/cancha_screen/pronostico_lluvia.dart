import 'package:flutter/material.dart';
import 'package:tennisapp/provider/provider.dart';

class PronosticoLluvia extends StatelessWidget {
  const PronosticoLluvia({
    super.key,
    required this.resFormProv,
  });

  final ReserveFormProvider resFormProv;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        // color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      width: 80,
      height: 98,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Icon(
          Icons.cloudy_snowing,
          color: Colors.deepPurple,
          size: 80,
        ),
        Text(
          resFormProv.pop,
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.deepPurple),
        ),
      ]),
    );
  }
}
