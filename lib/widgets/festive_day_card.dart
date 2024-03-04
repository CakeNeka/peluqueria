import 'package:flutter/material.dart';
import 'package:peluqueria/models/models.dart';
import 'package:peluqueria/theme/app_theme.dart';

class FestiveDayCard extends StatelessWidget {
  const FestiveDayCard({super.key, required this.diaFestivo});
  final DiaFestivo diaFestivo;

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
            diaFestivo.festiveName,
            style: const TextStyle(color: Colors.white, fontSize: 17),
          ),
        ),
      ),
    );
  }
}
