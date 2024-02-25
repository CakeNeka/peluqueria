import 'package:flutter/material.dart';
import 'package:peluqueria/widgets/widgets.dart';

class ReservasScreen extends StatelessWidget {
  const ReservasScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consulta de Reservas"),
      ),
      endDrawer: DefaultDrawer(selectedIndex: 3),
    );
  }
}
