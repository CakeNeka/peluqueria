import 'package:flutter/material.dart';
import 'package:peluqueria/components/components.dart';

class GestionPeluquerosScreen extends StatelessWidget {
  const GestionPeluquerosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gestión de Personal"),
      ),
      endDrawer: DefaultDrawer(selectedIndex: 2),
    );
  }
}
