// To parse this JSON data, do
//
//     final reservaModel = reservaModelFromMap(jsonString);

class ReservaModel {
  ReservaModel({
    this.id,
    required this.nombre,
    required this.fecha,
    required this.cancha,
    required this.horainicio,
    required this.horafin,
  });

  int? id;
  String nombre;
  String fecha;
  int cancha;
  String horainicio;
  String horafin;

  factory ReservaModel.fromJson(Map<String, dynamic> json) => ReservaModel(
        id: json["id"],
        nombre: json["nombre"],
        fecha: json["fecha"],
        cancha: json["cancha"],
        horainicio: json["horainicio"],
        horafin: json["horafin"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "fecha": fecha,
        "cancha": cancha,
        "horainicio": horainicio,
        "horafin": horafin,
      };
}
