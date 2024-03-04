import 'dart:convert';

class Reserva {
  bool cancelada;
  List<DateTime> fecha;
  bool pagada;
  String pago;
  String peluquero;
  Map<String, bool> servicios;
  String usuario;
  String? id;

  Reserva({
    required this.cancelada,
    required this.fecha,
    required this.pagada,
    required this.pago,
    required this.peluquero,
    required this.servicios,
    required this.usuario,
    this.id,
  });

  factory Reserva.fromRawJson(String str) => Reserva.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Reserva.fromJson(Map<String, dynamic> json) => Reserva(
        cancelada: json["cancelada:"],
        fecha: List<DateTime>.from(json["fecha"].map((x) => DateTime.parse(x))),
        pagada: json["pagada"],
        pago: json["pago"],
        peluquero: json["peluquero"],
        servicios: Map.from(json["servicios"])
            .map((k, v) => MapEntry<String, bool>(k, v)),
        usuario: json["usuario"],
      );

  Map<String, dynamic> toJson() => {
        "cancelada:": cancelada,
        "fecha": List<dynamic>.from(fecha.map((x) => x.toIso8601String())),
        "pagada": pagada,
        "pago": pago,
        "peluquero": peluquero,
        "servicios":
            Map.from(servicios).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "usuario": usuario,
      };
}
