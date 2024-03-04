import 'package:flutter/material.dart';
import 'package:peluqueria/widgets/widgets.dart';
import 'package:peluqueria/services/usuarios_services.dart';

class UsuarioScreen extends StatefulWidget {
  final String id;
  final String nombre;
  final String rol;
  final String horaInicio;
  final String horaFin;

  const UsuarioScreen(
      {Key? key,
      required this.nombre,
      required this.rol,
      required this.id,
      required this.horaInicio,
      required this.horaFin})
      : super(key: key);

  @override
  _UsuarioScreenState createState() => _UsuarioScreenState();
}

class _UsuarioScreenState extends State<UsuarioScreen> {
  late TimeOfDay horaInicioSeleccionada;
  late TimeOfDay horaFinSeleccionada;

  @override
  void initState() {
    super.initState();
    horaInicioSeleccionada = TimeOfDay(hour: 7, minute: 15);
    horaFinSeleccionada = TimeOfDay(hour: 12, minute: 45);
  }

  @override
  Widget build(BuildContext context) {
    UsuariosServices usuariosServices = UsuariosServices();
    TimeSelector timeSelector1;
    TimeSelector timeSelector2;
    DateSelector dateSelector = const DateSelector();
    List<String> listaDeOpciones = <String>["Usuario", "Peluquero", "Gerente"];
    String rolActual = "Usuario";
    for (String opcion in listaDeOpciones) {
      if (opcion == widget.rol) {
        rolActual = opcion;
      }
    }
    DropList dropList =
        DropList(rolActual: rolActual, listaDeOpciones: listaDeOpciones);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Gestion de usuarios'),
          backgroundColor: Colors.black87,
          foregroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Column(
                children: [
                  const Icon(Icons.account_circle, size: 130),
                  Text(widget.nombre,
                      style:
                          const TextStyle(color: Colors.black87, fontSize: 26)),
                  dropList,
                  timeSelector1 = TimeSelector(
                    type: 0,
                    id: widget.id,
                    onTimeSelected: (time) {
                      setState(() {
                        horaInicioSeleccionada = time;
                      });
                    },
                  ),
                  timeSelector2 = TimeSelector(
                    type: 1,
                    id: widget.id,
                    onTimeSelected: (time) {
                      setState(() {
                        horaFinSeleccionada = time;
                      });
                    },
                  ),
                  dateSelector,
                  Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black87),
                        child: const Text("Aplicar",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        onPressed: () {
                          usuariosServices.updateUsuarioRol(
                              widget.id, dropList.rolActual);
                          String horaInicioFormatted =
                              '${horaInicioSeleccionada.hour.toString().padLeft(2, '0')}:${horaInicioSeleccionada.minute.toString().padLeft(2, '0')}';
                          usuariosServices.updateUsuarioHoraInicio(
                              widget.id, horaInicioFormatted);

                          String horaFinFormatted =
                              '${horaFinSeleccionada.hour.toString().padLeft(2, '0')}:${horaFinSeleccionada.minute.toString().padLeft(2, '0')}';
                          usuariosServices.updateUsuarioHoraFin(
                              widget.id, horaFinFormatted);
                        },
                      ))
                ],
              ),
            ),
          ),
        ));
  }
}

class DropList extends StatelessWidget {
  DropList({
    super.key,
    required this.rolActual,
    required this.listaDeOpciones,
  });

  String rolActual;
  final List<String> listaDeOpciones;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.black87,
          width: 1,
        ),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: DropdownButtonFormField(
        value: rolActual,
        items: listaDeOpciones.map((e) {
          return DropdownMenuItem(value: e, child: Text(e));
        }).toList(),
        onChanged: (String? value) {
          rolActual = value ?? "Usuario";
        },
      ),
    );
  }
}
