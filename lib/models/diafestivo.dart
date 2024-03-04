import 'dart:convert';

class DiaFestivo {
  String? id;
  String fecha;
  String nombreFestivo;

  DiaFestivo({this.id, required this.fecha, required this.nombreFestivo});

  factory DiaFestivo.fromRawJson(String str) =>
      DiaFestivo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DiaFestivo.fromJson(Map<String, dynamic> json) =>
      DiaFestivo(fecha: json["fecha"] ?? "1970-01-01", nombreFestivo: json["nombreFestivo"] ?? "Desconocido");

  Map<String, dynamic> toJson() =>
      {"fecha": fecha, "nombreFestivo": nombreFestivo};
}
