import 'package:flutter/material.dart';
import 'package:peluqueria/providers/connected_user_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class DefaultDrawer extends StatelessWidget {
  final int selectedIndex;

  const DefaultDrawer({
    super.key,
    required this.selectedIndex,
  });

  Future<void> _launchWhatsapp() async {
    var _whatsappURL =
        Uri.parse("https://wa.me/+34666666666?text=${Uri.tryParse("reserva")}");
    if (!await launchUrl(_whatsappURL)) {
      throw Exception('Could not launch $_whatsappURL');
    }
  }

  Future<void> _launchPhoneApp() async {
    var _whatsappURL = Uri.parse("tel:+34666666666");
    if (!await launchUrl(_whatsappURL)) {
      throw Exception('Could not launch $_whatsappURL');
    }
  }

  @override
  Widget build(BuildContext context) {
    final userProvider =
        Provider.of<ConnectedUserProvider>(context, listen: false);
    String rol = userProvider.getActiveUserRol().toLowerCase();
    print(userProvider.activeUser.toJson());
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName:
                Text("Conectado como: ${userProvider.activeUser.nombre}"),
            accountEmail: Text("Rol: $rol"),
          ),
          ListTile(
            title: const Text('Página Principal'),
            selected: selectedIndex == 0,
            onTap: () {
              Navigator.pushReplacementNamed(context, 'home');
            },
          ),
          if (rol == "gerente")
            ListTile(
              title: const Text('Horario Semanal'),
              selected: selectedIndex == 1,
              onTap: () {
                Navigator.pushReplacementNamed(context, 'gestion_horario');
              },
            ),
          if (rol == "gerente")
            ListTile(
              title: const Text('Dias Festivos'),
              selected: selectedIndex == 2,
              onTap: () {
                Navigator.pushReplacementNamed(context, 'gestion_calendario');
              },
            ),
          if (rol == "gerente")
            ListTile(
              title: const Text('Gestión de Peluqueros'),
              selected: selectedIndex == 3,
              onTap: () {
                Navigator.pushReplacementNamed(context, 'gestion_peluqueros');
              },
            ),
          ListTile(
            title: const Text('Reservas'),
            selected: selectedIndex == 4,
            onTap: () {
              Navigator.pushReplacementNamed(context, 'reservas');
            },
          ),
          Divider(
            thickness: 0.5,
            color: Colors.grey[400],
          ),
          ListTile(
            title: Column(
              children: [
                Text("Contacta!"),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () => _launchWhatsapp(),
                      icon: Container(
                        width: 40,
                        child: Image.asset("assets/whatsapp.ico"),
                      ),
                    ),
                    SizedBox(width: 60),
                    IconButton(
                      onPressed: () => _launchPhoneApp(),
                      icon: Icon(
                        Icons.phone,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
