import 'dart:convert';

class Usuario {
  String email;
  String genero;
  String? id;
  String nombre;
  String rol;
  String telefono;
  String? horaInicial;
  String? horaFin;
  bool verificado = false;

  Usuario({
    required this.email,
    required this.genero,
    this.id,
    required this.nombre,
    required this.rol,
    required this.telefono,
    this.horaInicial,
    this.horaFin,
    required this.verificado,
  });

  factory Usuario.fromRawJson(String str) => Usuario.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        email: json["email"],
        genero: json["genero"],
        nombre: json["nombre"],
        rol: json["rol"],
        telefono: json["telefono"],
        horaInicial: json["horainicial"],
        horaFin: json["horaFin"],
        verificado: json["verificado"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "genero": genero,
        "nombre": nombre,
        "rol": rol,
        "telefono": telefono,
        "horaInicial": horaInicial,
        "horaFin": horaFin,
        "verificado": verificado,
      };
}
