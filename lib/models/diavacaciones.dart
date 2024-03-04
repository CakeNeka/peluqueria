import 'dart:convert';

class DiaVacaciones {
  String? id;
  String fecha;

  DiaVacaciones({this.id, required this.fecha});

  factory DiaVacaciones.fromRawJson(String str) =>
      DiaVacaciones.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DiaVacaciones.fromJson(Map<String, dynamic> json) =>
      DiaVacaciones(fecha: json["fecha"]);

  Map<String, dynamic> toJson() =>
      {"fecha": fecha};
}
