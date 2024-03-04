import 'package:flutter/material.dart';
import 'package:peluqueria/models/reserva.dart';
import 'package:peluqueria/services/reservas_services.dart';
import 'package:peluqueria/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ReservasScreen extends StatefulWidget {
  const ReservasScreen({Key? key}) : super(key: key);

  @override
  State<ReservasScreen> createState() => _ReservasScreenState();
}

class _ReservasScreenState extends State<ReservasScreen> {
  final List<Reserva> reservas = [];

  @override
  void initState() {
    super.initState();
    loadReservas(context);
  }

  void loadReservas(context) async {
    List<Reserva> loaded = await ReservasServices().loadReservas();
    setState(() {
      reservas.addAll(loaded);
    });
  }

  String formatDate(DateTime date) {
    String stringDate =
        "${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.year.toString()}";
    stringDate += ", ${date.hour}:${date.minute}";
    return stringDate;
  }

  String getDate(DateTime date) {
    return "${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.year.toString()}";
  }

  String getTime(DateTime date) {
    return ", ${date.hour}:${date.minute}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Consulta de Reservas"),
        ),
        endDrawer: DefaultDrawer(selectedIndex: 4),
        body: ListView.separated(
          itemBuilder: (context, index) => Column(children: [
            Text(
              formatDate(reservas[index].fecha.first),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text("C. Palencia, 11, 18007 Granada"),
            Text(reservas[index].peluquero),
            Row(children: [
              Text(getTime(reservas[index].fecha.first)),
              Expanded(child: SizedBox()),
              Text(getDate(reservas[index].fecha.first)),
            ]),
            Divider(),
            Row(children: [
              Text("SERVICIOS:"),
              Expanded(child: SizedBox()),
              Text("${reservas[index].servicios.keys.toString()}")
            ]),
            Divider(),
            Row(children: [
              Text("PAGADA:"),
              Expanded(child: SizedBox()),
              Text("${reservas[index].pagada}")
            ]),
            Row(children: [
              Text("FORMA DE PAGO:"),
              Expanded(child: SizedBox()),
              Text("${reservas[index].pago}")
            ]),
          ]),
          separatorBuilder: (context, index) => const Divider(
            thickness: 4,
          ),
          itemCount: reservas.length,
        ));
  }
}
