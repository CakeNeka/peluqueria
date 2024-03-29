import 'package:flutter/material.dart';
import 'package:peluqueria/models/dia_festivo.dart';
import 'package:peluqueria/services/services.dart';
import 'package:peluqueria/theme/app_theme.dart';
import 'package:peluqueria/widgets/widgets.dart';
import 'package:provider/provider.dart';

class GestionHorarioCalendarioScreen extends StatelessWidget {
  const GestionHorarioCalendarioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final diasFestivosService = Provider.of<DiasFestivosServices>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dias Festivos"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: diasFestivosService.diasFestivos.length,
          itemBuilder: (BuildContext context, int index) => GestureDetector(
            child: FestiveDayCard(
              diaFestivo: diasFestivosService.diasFestivos[index],
            ),
            onTap: () {
              diasFestivosService.diaFestivoSeleccionado =
                  diasFestivosService.diasFestivos[index].copy();
              Navigator.pushNamed(context, 'dia_festivo');
            },
          ),
        ),
      ),
      endDrawer: const DefaultDrawer(selectedIndex: 2),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          diasFestivosService.diaFestivoSeleccionado =
              DiaFestivo(day: 1, month: 1, year: 2000, festiveName: "");
          Navigator.pushNamed(context, 'dia_festivo');
        },
        backgroundColor: AppTheme.primary,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
