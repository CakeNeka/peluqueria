import 'package:flutter/material.dart';
import 'package:peluqueria/screens/screens.dart';
import 'package:peluqueria/theme/app_theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peluquería',
      initialRoute: 'login',
      routes: {
        'login': (_) => LoginScreen(),
        'home': (_) => HomeScreen(),
        'gestion_horario': (_) => GestionHorarioScreen(),
        'gestion_peluqueros': (_) => GestionPeluquerosScreen(),
        'gestion_horarios': (_) => GestionHorarioScreen(),
        'reservas': (_) => ReservasScreen(),
      },
      theme: AppTheme.lightMode,
      darkTheme: AppTheme.lightMode,
    );
  }
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [],
    );
  }
}
