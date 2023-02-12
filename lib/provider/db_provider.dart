import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:tennisapp/models/reserva_model.dart';

class DBProvider {
  static Database? _datebase;
  static final DBProvider db = DBProvider._();
  DBProvider._();

  Future<Database> get database async {
    if (_datebase != null) {
      return _datebase!;
    }

    _datebase = await initDB();

    return _datebase!;
  }

  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'DBReserva.db');
    // print(path);

    return await openDatabase(path, version: 2, onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE Reserva(
          id INTEGER PRIMARY KEY,
          nombre TEXT,
          fecha TEXT,
          cancha INTEGER,
          horainicio TEXT,
          horafin TEXT
        )
      ''');
    });
  }

  Future<int> nuevaReserva(ReservaModel nuevaReserva) async {
    final db = await database;
    final res = await db.insert('Reserva', nuevaReserva.toJson());
    return res;
  }

  Future<List<ReservaModel>?> getReservaDate(String date, int cancha) async {
    // print(date);
    final db = await database;
    final res = await db.query('Reserva',
        where: 'cancha = ? and fecha = ?', whereArgs: [cancha, date]);
    // where: 'fecha = ? and cancha = ?', whereArgs: [date, cancha]);

    return res.isNotEmpty
        ? res.map((e) => ReservaModel.fromJson(e)).toList()
        : [];
  }

  Future<int> deleteReserva(int id) async {
    final db = await database;
    final res = await db.delete('Reserva', where: 'id = ?', whereArgs: [id]);
    return res;
  }
}
