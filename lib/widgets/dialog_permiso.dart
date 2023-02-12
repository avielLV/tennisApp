import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/services.dart';

class DialogPermiso extends StatelessWidget {
  String fecha;
  int id;
  int cancha;
  DialogPermiso(
      {super.key, required this.fecha, required this.id, required this.cancha});

  @override
  Widget build(BuildContext context) {
    final homeService = Provider.of<HomeService>(context);

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: const EdgeInsets.all(20),
        width: 200,
        height: 140,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              '¿Quieres eliminar reserva?',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                          side: const BorderSide(
                              color: Colors.deepPurple, width: 1),
                          borderRadius: BorderRadius.circular(4)),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const SizedBox(
                      width: 100,
                      child: Center(
                          child: Text(
                        'No',
                        style: TextStyle(color: Colors.deepPurple),
                      ))),
                ),
                const SizedBox(width: 8),
                TextButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.deepPurple)),
                  onPressed: () {
                    homeService.borrarReserva(id);
                    homeService.cargarReserva(fecha, cancha);
                    Navigator.pop(context);
                  },
                  child: const SizedBox(
                      width: 100,
                      child: Center(
                          child: Text(
                        'Si',
                        style: TextStyle(color: Colors.white),
                      ))),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
