import 'package:flutter/material.dart';

class DefaultDrawer extends StatelessWidget {
  final int selectedIndex;

  const DefaultDrawer({
    super.key,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
            ),
            child: Text("Menú principal"),
          ),
          ListTile(
            title: const Text('Página Principal'),
            selected: selectedIndex == 0, // boolean
            onTap: () {
              Navigator.pushReplacementNamed(context, 'home');
            },
          ),
          ListTile(
            title: const Text('Gestión de Horario'),
            selected: selectedIndex == 1, // boolean
            onTap: () {
              Navigator.pushReplacementNamed(context, 'gestion_horario');
            },
          ),
          ListTile(
            title: const Text('Gestión de Peluqueros'),
            selected: selectedIndex == 2, // boolean
            onTap: () {
              Navigator.pushReplacementNamed(context, 'gestion_peluqueros');
            },
          ),
          ListTile(
            title: const Text('Reservas'),
            selected: selectedIndex == 3, // boolean
            onTap: () {
              Navigator.pushReplacementNamed(context, 'reservas');
            },
          ),
          ListTile(
            title: const Text('Consulta Horarios Disponibles'),
            selected: selectedIndex == 4, // boolean
            onTap: () {
              Navigator.pushReplacementNamed(context, 'consulta_horarios');
            },
          ),
        ],
      ),
    );
  }
}
