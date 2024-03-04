import 'package:flutter/material.dart';
import 'package:peluqueria/models/usuario.dart';
import 'package:peluqueria/services/usuarios_services.dart';

class TimeSelector extends StatefulWidget {
  final int type;
  final String id;
  final Function(TimeOfDay) onTimeSelected;

  const TimeSelector(
      {Key? key,
      required this.type,
      required this.id,
      required this.onTimeSelected})
      : super(key: key);

  @override
  _TimeSelectorState createState() => _TimeSelectorState();
}

class _TimeSelectorState extends State<TimeSelector> {
  UsuariosServices usuariosServices = UsuariosServices();
  Usuario? usuario;
  TimeOfDay? _horaSeleccionada = TimeOfDay(hour: 12, minute: 12);
  TimeOfDay _horaInicial = TimeOfDay(hour: 7, minute: 15);
  TimeOfDay _horaFin = TimeOfDay(hour: 12, minute: 45);

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  void loadUser() async {
    usuario = await usuariosServices.getUsuarioById(widget.id);
    setState(() {
      String horaInicio = usuario?.horaInicial ?? "7:15";
      String horaFinal = usuario?.horaFin ?? "12:45";
      _horaInicial = TimeOfDay(
          hour: int.parse(horaInicio.split(":")[0]),
          minute: int.parse(horaInicio.split(":")[1]));
      _horaFin = TimeOfDay(
          hour: int.parse(horaFinal.split(":")[0]),
          minute: int.parse(horaFinal.split(":")[1]));
    });
  }

  Future<void> selectTime(BuildContext context) async {
    _horaSeleccionada = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: 12, minute: 12),
      initialEntryMode: TimePickerEntryMode.input,
      helpText: "Selecciona la hora",
      hourLabelText: "Hora",
      minuteLabelText: "Minuto",
      cancelText: "Cancelar",
      confirmText: "Confirmar",
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme:
                const ColorScheme.light(primary: Colors.black87, secondary: Colors.black38),
          ),
          child: child!,
        );
      },
    );
    if (_horaSeleccionada != null && widget.type == 0) {
      setState(() {
        _horaInicial = _horaSeleccionada!;
        widget.onTimeSelected(_horaSeleccionada!);
      });
    } else if (_horaSeleccionada != null && widget.type == 1) {
      setState(() {
        _horaFin = _horaSeleccionada!;
        widget.onTimeSelected(_horaSeleccionada!);
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    if (widget.type == 0) {
      return Container(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.black87),
          child: Text(
              'Hora de entrada: ${_formatTime(_horaInicial)}',
              style: const TextStyle(color: Colors.white, fontSize: 20)),
          onPressed: () => selectTime(context),
        ),
      );
    } else if (widget.type == 1) {
      return Container(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.black87),
          child: Text(
              'Hora de salida: ${_formatTime(_horaFin)}', 
              style: const TextStyle(color: Colors.white, fontSize: 20)),
          onPressed: () => selectTime(context),
        ),
      );
    } else {
      return Container(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.black87),
          child: Text(
              'Hora seleccionada: ${_formatTime(_horaSeleccionada)}', 
              style: const TextStyle(color: Colors.white, fontSize: 20)),
          onPressed: () => selectTime(context),
        ),
      );
    }
  }

  String _formatTime(TimeOfDay? time) {
    if (time == null) return '';
    final hours = time.hour.toString().padLeft(2, '0');
    final minutes = time.minute.toString().padLeft(2, '0');
    return '$hours:$minutes';
  }
}
