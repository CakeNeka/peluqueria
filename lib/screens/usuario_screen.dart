import 'package:flutter/material.dart';
import 'package:peluqueria/widgets/widgets.dart';

class UsuarioScreen extends StatelessWidget {
  final String nombre;
  final String rol;

  const UsuarioScreen({Key? key, required this.nombre, required this.rol})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> listaDeOpciones = <String>["Usuario", "Peluquero"];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestion de usuarios'),
        backgroundColor: Colors.black87,
        foregroundColor: Colors.white,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Column(
            children: [
              const Icon(Icons.account_circle, size: 130),
              Text(nombre,
                  style: TextStyle(color: Colors.black87, fontSize: 26)),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
                child: DropdownButtonFormField(
                  items: listaDeOpciones.map((e) {
                    return DropdownMenuItem(child: Text(e), value: e);
                  }).toList(),
                  onChanged: (String? value) {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
