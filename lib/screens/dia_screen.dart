import 'package:flutter/material.dart';
import 'package:peluqueria/models/models.dart';
import 'package:peluqueria/services/dias_services.dart';
import 'package:peluqueria/theme/app_theme.dart';
import 'package:provider/provider.dart';

class DiaScreen extends StatelessWidget {
  const DiaScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modificar Horario'),
      ),
      body: const Column(
        children: [
          _DiaForm(),
        ],
      ),
    );
  }
}

class _DiaForm extends StatefulWidget {
  const _DiaForm();

  @override
  State<StatefulWidget> createState() => _DiaFormState();
}

class _DiaFormState extends State<_DiaForm> {
  @override
  Widget build(BuildContext context) {
    final diaService = Provider.of<DiasServices>(context);
    final Dia? dia = diaService.diaSeleccionado;

    TimeOfDay startTimeMorning = TimeOfDay(
        hour: dia!.startTimeMorningHour, minute: dia.startTimeMorningMinute);
    TimeOfDay endTimeMorning = TimeOfDay(
        hour: dia.endTimeMorningHour, minute: dia.endTimeMorningMinute);
    TimeOfDay startTimeEvening = TimeOfDay(
        hour: dia.startTimeEveningHour, minute: dia.startTimeEveningMinute);
    TimeOfDay endTimeEvening = TimeOfDay(
        hour: dia.endTimeEveningHour, minute: dia.endTimeEveningMinute);

    Future<void> setHourAndMinute(int minute, int hour, int index) async {
      if (minute % 15 == 0) {
        setState(
          () {
            switch (index) {
              case 1:
                dia.startTimeMorningHour = hour;
                dia.startTimeMorningMinute = minute;
                break;
              case 2:
                dia.endTimeMorningHour = hour;
                dia.endTimeMorningMinute = minute;
                break;
              case 3:
                dia.startTimeEveningHour = hour;
                dia.startTimeEveningMinute = minute;
                break;
              case 4:
                dia.endTimeEveningHour = hour;
                dia.endTimeEveningMinute = minute;
                break;
            }
          },
        );
      }
    }

    Future<void> selectTime(BuildContext context, int index) async {
      final TimeOfDay? picked =
          await showTimePicker(context: context, initialTime: TimeOfDay.now());
      if (picked != null) {
        if (index == 1 || index == 3) {
          if (picked.hour < dia.endTimeEveningHour && index == 3 && picked.hour != 0) {
            if (picked.minute <= dia.endTimeEveningMinute) {
              setHourAndMinute(picked.minute, picked.hour, index);
            }
          }
          if (picked.hour < dia.endTimeMorningHour && index == 1 && picked.hour != 0) {
            if (picked.minute <= dia.endTimeMorningMinute) {
              setHourAndMinute(picked.minute, picked.hour, index);
            }
          }
        } else {
          setHourAndMinute(picked.minute, picked.hour, index);
        }
      }
    }

    return Form(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            ListTile(
              tileColor: AppTheme.primary,
              title: Text(
                'Hora de inicio mañana: ${startTimeMorning.hour.toString().padLeft(2, '0')}:${startTimeMorning.minute.toString().padLeft(2, '0')}',
                style:
                    const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              ),
              trailing: const Icon(
                Icons.keyboard_arrow_down,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              onTap: () => selectTime(context, 1),
            ),
            ListTile(
              tileColor: AppTheme.primary,
              title: Text(
                'Hora de fin mañana: ${endTimeMorning.hour.toString().padLeft(2, '0')}:${endTimeMorning.minute.toString().padLeft(2, '0')}',
                style:
                    const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              ),
              trailing: const Icon(
                Icons.keyboard_arrow_down,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              onTap: () => selectTime(context, 2),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 40),
              child: Text("Turno Tarde"),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Switch(
                value: dia.lateShift,
                onChanged: (value) {
                  setState(() {
                    dia.lateShift = value;
                  });
                },
                activeColor: const Color.fromARGB(255, 255, 255, 255),
                inactiveThumbColor: const Color.fromARGB(255, 0, 0, 0),
                inactiveTrackColor: const Color.fromARGB(255, 255, 255, 255),
                activeTrackColor: const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            if (dia.lateShift)
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Column(
                  children: [
                    ListTile(
                      tileColor: AppTheme.primary,
                      title: Text(
                        'Hora de inicio tarde: ${startTimeEvening.hour.toString().padLeft(2, '0')}:${startTimeEvening.minute.toString().padLeft(2, '0')}',
                        style: const TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                      trailing: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      onTap: () => selectTime(context, 3),
                    ),
                    ListTile(
                      tileColor: AppTheme.primary,
                      title: Text(
                        'Hora de fin tarde: ${endTimeEvening.hour.toString().padLeft(2, '0')}:${endTimeEvening.minute.toString().padLeft(2, '0')}',
                        style: const TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                      trailing: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      onTap: () => selectTime(context, 4),
                    ),
                  ],
                ),
              ),
            FloatingActionButton(
              backgroundColor: AppTheme.primary,
              onPressed: () async {
                await diaService.updateDia(dia);
              },
              child: const Icon(Icons.edit_document),
            )
          ],
        ),
      ),
    );
  }
}
