import 'package:flutter/material.dart';
import 'package:peluqueria/widgets/widgets.dart';
import 'package:peluqueria/services/usuarios_services.dart';

class UsuarioScreen extends StatelessWidget {
  final String id;
  final String nombre;
  final String rol;

  const UsuarioScreen(
      {Key? key, required this.nombre, required this.rol, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    UsuariosServices usuariosServices = UsuariosServices();
    List<String> listaDeOpciones = <String>["Usuario", "Peluquero", "Gerente"];
    String rolActual = "Usuario";
    for (String opcion in listaDeOpciones) {
      if (opcion == rol) {
        rolActual = opcion;
      }
    }
    DropList dropList =
        DropList(rolActual: rolActual, listaDeOpciones: listaDeOpciones);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Gestion de usuarios'),
          backgroundColor: Colors.black87,
          foregroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Column(
                children: [
                  const Icon(Icons.account_circle, size: 130),
                  Text(nombre,
                      style:
                          const TextStyle(color: Colors.black87, fontSize: 26)),
                  dropList,
                  const TimeSelector(),
                  const TimeSelector(),
                  const DateSelector(),
                  Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black87),
                        child: const Text("Aplicar",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        onPressed: () {
                          usuariosServices.updateUsuarioRol(
                              id, dropList.rolActual);
                        },
                      ))
                ],
              ),
            ),
          ),
        ));
  }
}

class DropList extends StatelessWidget {
  DropList({
    super.key,
    required this.rolActual,
    required this.listaDeOpciones,
  });

  String rolActual;
  final List<String> listaDeOpciones;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.black87,
          width: 1,
        ),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: DropdownButtonFormField(
        value: rolActual,
        items: listaDeOpciones.map((e) {
          return DropdownMenuItem(value: e, child: Text(e));
        }).toList(),
        onChanged: (String? value) {
          rolActual = value ?? "Usuario";
        },
      ),
    );
  }
}
