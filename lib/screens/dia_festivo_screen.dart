import 'package:flutter/material.dart';
import 'package:peluqueria/models/models.dart';
import 'package:peluqueria/services/dias_services.dart';
import 'package:peluqueria/theme/app_theme.dart';
import 'package:provider/provider.dart';

class DiaFestivoScreen extends StatelessWidget {
  const DiaFestivoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> _selectDate() async {
      final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2101),
      );
      if (pickedDate != null) {
        print('Fecha seleccionada: $pickedDate');
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dia Festivo'),
      ),
      body: Form(
        child: Column(
          children: [
            ListTile(
              tileColor: AppTheme.primary,
              title: const Text(
                'Fecha: ',
                style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              ),
              trailing: const Icon(
                Icons.calendar_month,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              onTap: () => _selectDate(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'dia_festivo');
        },
        child: const Icon(Icons.save),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
