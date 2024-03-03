import 'package:flutter/material.dart';

class TimeSelector extends StatefulWidget {
  final int type;
  const TimeSelector({Key? key, required this.type}) : super(key: key);

  @override
  _TimeSelectorState createState() => _TimeSelectorState();
}

class _TimeSelectorState extends State<TimeSelector> {
  TimeOfDay _horaInicial = TimeOfDay(hour: 7, minute: 15);
  TimeOfDay _horaFin = TimeOfDay(hour: 12, minute: 45);

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? horaSeleccionada = await showTimePicker(
      context: context,
      initialTime: _horaInicial,
      initialEntryMode: TimePickerEntryMode.input,
      helpText: "Selecciona la hora",
      hourLabelText: "Hora",
      minuteLabelText: "Minuto",
      cancelText: "Cancelar",
      confirmText: "Confirmar",
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
                primary: Colors.black87, secondary: Colors.black38),
          ),
          child: child!,
        );
      },
    );
    if (horaSeleccionada != null) {
      setState(() {
        _horaInicial = horaSeleccionada;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.type == 0) {
      return Container(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.black87),
        child: Text('Hora de entrada: ${_horaInicial.format(context)}',
            style: const TextStyle(color: Colors.white, fontSize: 20)),
        onPressed: () => selectTime(context),
      ),
    );
    } else if (widget.type == 1){
       return Container(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.black87),
        child: Text('Hora de salida: ${_horaFin.format(context)}',
            style: const TextStyle(color: Colors.white, fontSize: 20)),
        onPressed: () => selectTime(context),
      ),
    );
    } else {
      return Container(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.black87),
        child: Text('Hora seleccionada: ${_horaInicial.format(context)}',
            style: const TextStyle(color: Colors.white, fontSize: 20)),
        onPressed: () => selectTime(context),
      ),
    );
    }

  }
}
