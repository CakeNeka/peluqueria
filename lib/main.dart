import 'package:flutter/material.dart';
import 'package:peluqueria/providers/connected_user_provider.dart';
import 'package:peluqueria/screens/screens.dart';
import 'package:peluqueria/services/services.dart';
import 'package:peluqueria/theme/app_theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppState());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    UsuariosServices misUsuariosServices = UsuariosServices();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peluquería',
      initialRoute:
          'home', // Tiene que ser login. Para pruebas cambiar por home
      routes: {
        'login': (_) => LoginScreen(),
        'register': (_) => RegisterScreen(),
        'home': (_) => HomeScreen(),
        'gestion_horario': (_) =>
            GestionHorarioScreen(), // Calendario y Horario de Apertura
        'gestion_peluqueros': (_) =>
            GestionPeluquerosScreen(usuariosServices: misUsuariosServices),
        'reservas': (_) => ReservasScreen(),
        'consulta_horarios': (_) => ConsultaHorariosScreen(),
      },
      theme: AppTheme.lightMode,
      darkTheme: AppTheme.lightMode, // TODO: Implementar tema oscuro
    );
  }
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => UsuariosServices()),
        ChangeNotifierProvider(create: (_) => ConnectedUserProvider()),
      ],
      child: MyApp(),
    );
  }
}
