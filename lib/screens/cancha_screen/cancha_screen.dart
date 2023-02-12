import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tennisapp/helpers/helpers.dart';
import 'package:tennisapp/provider/provider.dart';
import 'package:tennisapp/screens/cancha_screen/pronostico_lluvia.dart';
import 'package:tennisapp/screens/cancha_screen/widget/text_form_field_custom.dart';
import 'package:tennisapp/services/services.dart';
import 'package:tennisapp/widgets/widgets.dart';

import '../../models/models.dart';

class CanchaScreen extends StatelessWidget {
  const CanchaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('Elige tu cancha'),
          backgroundColor: Colors.deepPurple,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: ChangeNotifierProvider(
                  create: (context) => ReserveFormProvider(),
                  child: const _FromCancha(),
                ),
              )
            ],
          ),
        ));
  }
}

class _FromCancha extends StatelessWidget {
  const _FromCancha();

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    final homeService = Provider.of<HomeService>(context);
    final resFormProv = Provider.of<ReserveFormProvider>(context);
    // resFormProv.dateTime = homeProvider.date;
    resFormProv.valorCancha = homeProvider.cancha;

    lluvia() {
      for (var element in homeService.clima) {
        if (element.datetime.format == resFormProv.dateTime.format) {
          resFormProv.pop = '${element.pop}%';
        }
      }
    }

    return Form(
        child: Column(
      children: [
        TextFormFiledCustom(reservaformProvider: resFormProv),
        const SizedBox(height: 20),
        const Text('Elige la fecha'),
        const SizedBox(height: 2),
        DatePicker(
          DateTime.now(),
          height: 82,
          selectionColor: Colors.deepPurple,
          locale: 'es_ES',
          daysCount: 16,
          onDateChange: (selectedDate) {
            resFormProv.dateTime = selectedDate;
            lluvia();
          },
        ),
        const SizedBox(height: 20),
        const Text('Elige la cancha'),
        const SizedBox(height: 20),
        SelectCancha(
          valor: resFormProv.valorCancha,
          initindex: homeProvider.cancha,
        ),
        const SizedBox(height: 20),
        const Text('Elige la hora'),
        const SizedBox(height: 2),
        SelectTime(reservaformProvider: resFormProv),
        const SizedBox(height: 20),
        PronosticoLluvia(resFormProv: resFormProv),
        const SizedBox(height: 60),
        TextButton(
          style: _textButtonStyle(),
          onPressed: () async {
            await _validarForm(resFormProv, homeService, homeProvider, context);
          },
          child: const Text(
            'Reservar',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ],
    ));
  }

  Future<void> _validarForm(
      ReserveFormProvider resFormProv,
      HomeService homeService,
      HomeProvider homeProvider,
      BuildContext context) async {
    if (resFormProv.nombre.isNotEmpty) {
      await _validarHora(homeService, resFormProv);
      if (!(resFormProv.dateTime.toString() == '2000-01-01 00:00:00.000')) {
        if (resFormProv.randoTime.start != resFormProv.randoTime.end) {
          final paso = await _validarHora(homeService, resFormProv);

          if (paso == 1) {
            await _nuevaReservacion(
                homeService, resFormProv, homeProvider, context);
          } else if (paso == 2) {
            NotificationsService.showSnackbar(
                'horas seleccionadas en reservacion');
          } else {
            NotificationsService.showSnackbar(
                'reservacion limited por dia alcanzado eliga otra cancha o otro dia');
          }
        } else {
          NotificationsService.showSnackbar('Seleccione una rango de horas');
        }
      } else {
        NotificationsService.showSnackbar('Seleccione una fecha');
      }
    } else {
      NotificationsService.showSnackbar('Nombre necesario');
    }
  }

  Future<void> _nuevaReservacion(
      HomeService homeService,
      ReserveFormProvider resFormProv,
      HomeProvider homeProvider,
      BuildContext context) async {
    await homeService.nuevaReserva(_reservaModel(resFormProv, context));
    await homeService.cargarReserva(
        homeProvider.date.format, resFormProv.valorCancha);
    Navigator.pop(context);
  }

  Future<int> _validarHora(
      HomeService homeService, ReserveFormProvider resFormProv) async {
    TimeOfDay stringToTimeOfDay(String tod) {
      final format = DateFormat.jm();
      return TimeOfDay.fromDateTime(format.parse(tod));
    }

    final reserva = await homeService.cargarReserva(
        resFormProv.dateTime.format, resFormProv.valorCancha);

    print(reserva.length);
    if (reserva.length == 3) {
      return 3;
    }
    for (var element in reserva) {
      if (!(resFormProv.randoTime.end.hour <=
              stringToTimeOfDay(element.horainicio).hour ||
          resFormProv.randoTime.start.hour >=
              stringToTimeOfDay(element.horafin).hour)) {
        return 2;
      }
    }
    return 1;
  }

  ReservaModel _reservaModel(
      ReserveFormProvider resFormProv, BuildContext context) {
    return ReservaModel(
      nombre: resFormProv.nombre,
      fecha: resFormProv.dateTime.format,
      cancha: resFormProv.valorCancha,
      horainicio: resFormProv.randoTime.start.format(context),
      horafin: resFormProv.randoTime.end.format(context),
    );
  }

  ButtonStyle _textButtonStyle() {
    return ButtonStyle(
        fixedSize: MaterialStateProperty.all(const Size(120, 50)),
        backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
        overlayColor: MaterialStateProperty.all(Colors.white.withOpacity(0.2)),
        shape: MaterialStateProperty.all(const StadiumBorder()));
  }
}
