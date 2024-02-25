import 'package:flutter/material.dart';
import 'package:peluqueria/widgets/widgets.dart';

class GestionHorarioScreen extends StatelessWidget {
  const GestionHorarioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gestión de Horarios"),
      ),
      endDrawer: DefaultDrawer(selectedIndex: 1),
    );
  }
}
