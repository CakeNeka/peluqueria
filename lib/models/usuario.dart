import 'dart:convert';

class Usuario {
  String email;
  String genero;
  String? id;
  String nombre;
  String rol;
  String telefono;
  String? horaInicialLunes;
  String? horaFinLunes;
  String? horaInicialMartes;
  String? horaFinMartes;
  String? horaInicialMiercoles;
  String? horaFinMiercoles;
  String? horaInicialJueves;
  String? horaFinJueves;
  String? horaInicialViernes;
  String? horaFinViernes;
  String? horaInicialSabado;
  String? horaFinSabado;
  String? horaInicialDomingo;
  String? horaFinDomingo;
  bool verificado = false;

  Usuario({
    required this.email,
    required this.genero,
    this.id,
    required this.nombre,
    required this.rol,
    required this.telefono,
    this.horaInicialLunes,
    this.horaFinLunes,
    this.horaInicialMartes,
    this.horaFinMartes,
    this.horaInicialMiercoles,
    this.horaFinMiercoles,
    this.horaInicialJueves,
    this.horaFinJueves,
    this.horaInicialViernes,
    this.horaFinViernes,
    this.horaInicialSabado,
    this.horaFinSabado,
    this.horaInicialDomingo,
    this.horaFinDomingo,
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
        horaInicialLunes: json["horaentradalunes"],
        horaFinLunes: json["horasalidalunes"],
        horaInicialMartes: json["horaentradamartes"],
        horaFinMartes: json["horasalidamartes"],
        horaInicialMiercoles: json["horaentradamiercoles"],
        horaFinMiercoles: json["horasalidamiercoles"],
        horaInicialJueves: json["horaentradajueves"],
        horaFinJueves: json["horasalidajueves"],
        horaInicialViernes: json["horaentradaviernes"],
        horaFinViernes: json["horasalidaviernes"],
        horaInicialSabado: json["horaentradasabado"],
        horaFinSabado: json["horasalidasabado"],
        horaInicialDomingo: json["horaentradadomingo"],
        horaFinDomingo: json["horasalidadomingo"],
        verificado: json["verificado"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "genero": genero,
        "nombre": nombre,
        "rol": rol,
        "telefono": telefono,
        "horaentradalunes": horaInicialLunes,
        "horasalidalunes": horaFinLunes,
        "horaentradamartes": horaInicialMartes,
        "horasalidamartes": horaFinMartes,
        "horaentradamiercoles": horaInicialMiercoles,
        "horasalidamiercoles": horaFinMiercoles,
        "horaentradajueves": horaInicialJueves,
        "horasalidajueves": horaFinJueves,
        "horaentradaviernes": horaInicialViernes,
        "horasalidaviernes": horaFinViernes,
        "horaentradasabado": horaInicialSabado,
        "horasalidasabado": horaFinSabado,
        "horaentradadomingo": horaInicialDomingo,
        "horasalidadomingo": horaFinDomingo,
        "verificado": verificado,
      };
}
