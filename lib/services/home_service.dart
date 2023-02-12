import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tennisapp/models/models.dart';
import 'package:tennisapp/provider/db_provider.dart';
import 'package:http/http.dart' as http;

class HomeService extends ChangeNotifier {
  List<ReservaModel> reservas = [];
  List<Datum> clima = [];
  final String _baseUrl = 'api.weatherbit.io';
  String pop = '';
  String error = '';

  HomeService() {
    climaRserva();
  }

  Future<int> nuevaReserva(ReservaModel reserva) async {
    final id = await DBProvider.db.nuevaReserva(reserva);
    return id;
  }

  Future<List<ReservaModel>> cargarReserva(String date, int cancha) async {
    reservas = await DBProvider.db.getReservaDate(date, cancha) ?? [];
    // print(reservas.length.toString());
    climaRserva();
    notifyListeners();
    return reservas;
  }

  borrarReserva(int id) async {
    await DBProvider.db.deleteReserva(id);
  }

  climaRserva() async {
    final url = Uri.https(_baseUrl, '/v2.0/forecast/daily', {
      'city': 'Caracas,VE',
      'key': '97b7dd9b61104e9194a6d5005c34be7f',
      'lang': 'es'
    });

    final resp = await http.get(url);
    if (resp.statusCode == 200 || resp.statusCode == 201) {
      final Map<String, dynamic> decodeData = jsonDecode(resp.body);
      final respB = ClimaModel.fromMap(decodeData);
      clima = respB.data;
    }
  }
}
