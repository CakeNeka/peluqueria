import 'package:flutter/material.dart';
import 'package:peluqueria/services/dias_services.dart';
import 'package:peluqueria/widgets/day_card.dart';
import 'package:peluqueria/widgets/widgets.dart';
import 'package:provider/provider.dart';

class GestionHorarioSemanalScreen extends StatelessWidget {
  const GestionHorarioSemanalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final diasService = Provider.of<DiasServices>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Horario Semanal"),
      ),
      body: ListView.builder(
        itemCount: diasService.dias.length,
        itemBuilder: (BuildContext context, int index) => GestureDetector(
          child: DayCard(
            dia: diasService.dias[index],
          ),
          onTap: () {
            diasService.diaSeleccionado = diasService.dias[index].copy();
            Navigator.pushNamed(context, 'dia');
          },
        ),
      ),
      endDrawer: const DefaultDrawer(selectedIndex: 1),
    );
  }
}
