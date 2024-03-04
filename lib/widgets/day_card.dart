import 'package:flutter/material.dart';
import 'package:peluqueria/models/models.dart';
import 'package:peluqueria/theme/app_theme.dart';

class DayCard extends StatelessWidget {
  const DayCard({super.key, required this.dia});
  final Dia dia;

  String getDiaSemana(String nombreDia) {
    String diaSemana = "";
    switch (nombreDia) {
      case 'domingo':
        diaSemana = "Domingo";
        break;
      case 'lunes':
        diaSemana = "Lunes";
        break;
      case 'martes':
        diaSemana = "Martes";
        break;
      case 'miercoles':
        diaSemana = "Miércoles";
        break;
      case 'jueves':
        diaSemana = "Jueves";
        break;
      case 'viernes':
        diaSemana = "Viernes";
        break;
      case 'sabado':
        diaSemana = "Sábado";
        break;
    }
    return diaSemana;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Container(
        width: double.infinity,
        height: 50,
        margin: const EdgeInsets.only(top: 10, bottom: 10),
        decoration: BoxDecoration(
            color: AppTheme.primary,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: AppTheme.primary,
                offset: Offset(0.2, 0.2),
                blurRadius: 2,
              )
            ]),
        child: Center(
          child: Text(
            getDiaSemana(dia.id!),
            style: const TextStyle(color: Colors.white, fontSize: 17),
          ),
        ),
      ),
    );
  }
}
