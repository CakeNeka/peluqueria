import 'dart:convert';

class DiaVacaciones {
  String? id;
  String fecha;
  String idUsuario;

  DiaVacaciones({this.id, required this.fecha, required this.idUsuario});

  factory DiaVacaciones.fromRawJson(String str) =>
      DiaVacaciones.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DiaVacaciones.fromJson(Map<String, dynamic> json) =>
      DiaVacaciones(fecha: json["fecha"], idUsuario: json["idUsuario"]);

  Map<String, dynamic> toJson() =>
      {"fecha": fecha, "idUsuario": idUsuario};
}
