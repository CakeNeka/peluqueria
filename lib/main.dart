import 'package:flutter/material.dart';
import 'package:peluqueria/providers/connected_user_provider.dart';
import 'package:peluqueria/screens/gestion_calendario_screen.dart';
import 'package:peluqueria/screens/screens.dart';
import 'package:peluqueria/services/reservas_services.dart';
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
          'login', // Tiene que ser login. Para pruebas cambiar por home
      routes: {
        'login': (_) => LoginScreen(),
        'register': (_) => RegisterScreen(),
        'home': (_) => HomeScreen(),
        'gestion_horario': (_) =>
            GestionHorarioSemanalScreen(), // Horario de Apertura
        'gestion_calendario': (_) =>
            GestionHorarioCalendarioScreen(), // Calendario - Dias festivos
        'gestion_peluqueros': (_) =>
            GestionPeluquerosScreen(usuariosServices: misUsuariosServices),
        'reservas': (_) => ReservasScreen(),
        'consulta_horarios': (_) => ConsultaHorariosScreen(),
        'dia': (_) => DiaScreen(),
        'dia_festivo': (_) => DiaFestivoScreen(),
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
        ChangeNotifierProvider(create: (_) => ReservasServices()),
        ChangeNotifierProvider(create: (_) => UsuariosServices()),
        ChangeNotifierProvider(create: (_) => ConnectedUserProvider()),
        ChangeNotifierProvider(create: (_) => DiasServices()),
        ChangeNotifierProvider(create: (_) => DiasFestivosServices()),
      ],
      child: MyApp(),
    );
  }
}
