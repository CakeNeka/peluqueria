import 'package:flutter/material.dart';
import 'package:peluqueria/models/usuario.dart';
import 'package:peluqueria/services/usuarios_services.dart';
import 'package:peluqueria/widgets/widgets.dart';

class GestionPeluquerosScreen extends StatefulWidget {
  final UsuariosServices usuariosServices;

  const GestionPeluquerosScreen({Key? key, required this.usuariosServices})
      : super(key: key);

  @override
  _GestionPeluquerosScreenState createState() =>
      _GestionPeluquerosScreenState();
}

class _GestionPeluquerosScreenState extends State<GestionPeluquerosScreen> {
  Set<Usuario> userSet = {};
  List<Usuario> filteredUserList = [];

  @override
  void initState() {
    super.initState();
    loadUsuarios();
  }

  void loadUsuarios() async {
    List<Usuario> loadedUsers = await widget.usuariosServices.loadUsuarios();
    setState(() {
      userSet.addAll(loadedUsers);
      filteredUserList = userSet.toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestion de peluqueros'),
        backgroundColor: Colors.black87,
        foregroundColor: Colors.white,
      ),
      endDrawer: const DefaultDrawer(selectedIndex: 2),
      body: ListView.builder(
        itemCount: filteredUserList.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    filteredUserList = userSet.where((user) => user.nombre.contains(value)).toList();
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Buscar',
                  labelStyle: TextStyle(color: Colors.black87),
                  prefixIcon: Icon(Icons.search),
                  fillColor: Colors.white54,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    borderSide: BorderSide(color: Colors.black87),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    borderSide: BorderSide(color: Colors.black87),
                  ),
                ),
              ),
            );
          } else {
            return UserCard(
                nombre: filteredUserList[index - 1].nombre,
                rol: filteredUserList[index - 1].rol,
                horaInicio: filteredUserList[index - 1].horaInicialLunes ?? "Sin hora",
                horaFin: filteredUserList[index - 1].horaFinLunes ?? "Sin hora",
                id: filteredUserList[index - 1].id ?? "No ID");
          }
        },
      ),
    );
  }
}
