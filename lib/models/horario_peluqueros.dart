import 'dart:convert';

class HorarioPeluqueros {
  String? id;
  String? horaEntrada;
  String? horaSalida;
  String? idUsuario;
  String? dia;

  HorarioPeluqueros({
    this.id,
    this.horaEntrada,
    this.horaSalida,
    this.idUsuario,
    this.dia
  });

  factory HorarioPeluqueros.fromRawJson(String str) =>
      HorarioPeluqueros.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HorarioPeluqueros.fromJson(Map<String, dynamic> json) =>
      HorarioPeluqueros(
        id: json['id'] ?? '',
        horaEntrada: json['horaentrada'],
        horaSalida: json['horasalida'],
        idUsuario: json['idusuario'],
        dia: json['dia']
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'horaentrada': horaEntrada,
        'horasalida': horaSalida,
        'idusuario': idUsuario,
        'dia': dia
      };
}
