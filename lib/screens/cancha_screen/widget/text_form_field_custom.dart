import 'package:flutter/material.dart';
import 'package:tennisapp/provider/reserva_form_provider.dart';

class TextFormFiledCustom extends StatelessWidget {
  const TextFormFiledCustom({
    super.key,
    required this.reservaformProvider,
  });

  final ReserveFormProvider reservaformProvider;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.deepPurple)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.deepPurple, width: 2)),
          hintText: 'Nombre de usuario',
          labelText: 'Nombre:',
          labelStyle: TextStyle(color: Colors.grey),
          prefixIcon: Icon(
            Icons.person,
          ),
          prefixIconColor: Colors.deepPurple),
      cursorColor: Colors.deepPurple,
      onChanged: (value) {
        reservaformProvider.nombre = value;
      },
    );
  }
}
