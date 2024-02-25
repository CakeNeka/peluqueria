import 'package:flutter/material.dart';
import 'package:peluqueria/widgets/widgets.dart';

class ConsultaHorariosScreen extends StatelessWidget {
  const ConsultaHorariosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consulta de Horarios"),
      ),
      endDrawer: DefaultDrawer(selectedIndex: 4),
    );
  }
}
