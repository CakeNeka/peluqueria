import 'dart:convert';

class Usuario {
  String email;
  String genero;
  String id;
  String nombre;
  String rol;
  String telefono;
  bool verificado = false;

  Usuario({
    required this.email,
    required this.genero,
    required this.id,
    required this.nombre,
    required this.rol,
    required this.telefono,
    required this.verificado,
  });

  factory Usuario.fromRawJson(String str) => Usuario.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        email: json["email"],
        genero: json["genero"],
        id: json["id"],
        nombre: json["nombre"],
        rol: json["rol"],
        telefono: json["telefono"],
        verificado: json["verificado"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "genero": genero,
        "id": id,
        "nombre": nombre,
        "rol": rol,
        "telefono": telefono,
        "verificado": verificado,
      };
}
