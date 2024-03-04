import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peluqueria/models/horario_peluqueros.dart';

class HorarioPeluquerosServices extends ChangeNotifier {
  final String _baseUrl =
      "pelu-siemens-default-rtdb.europe-west1.firebasedatabase.app";

  Future<String> saveHorario(
      String idUsuario, String dia, String horaEntrada, String horaSalida) async {
    final url = Uri.https(_baseUrl, 'horariopeluqueros.json');
    final resp = await http.post(url,
        body: jsonEncode({
          'idUsuario': idUsuario,
          'horarios': {
            dia: {
              'horaEntrada': horaEntrada,
              'horaSalida': horaSalida,
            }
          }
        }));
    return resp.body;
  }

  Future<String> updateHorario(String id, String idUsuario, String dia,
      String horaEntrada, String horaSalida) async {
    final url = Uri.https(_baseUrl, 'horariopeluqueros/$id.json');
    final resp = await http.patch(url,
        body: jsonEncode({
          'idUsuario': idUsuario,
          'horarios': {
            dia: {
              'horaEntrada': horaEntrada,
              'horaSalida': horaSalida,
            }
          }
        }));
    return resp.body;
  }

Future<String> updateHorarioHoraEntradaYHoraSalida(
    String idUsuario, String dia, String horaEntrada, String horaSalida) async {
  final url = Uri.https(_baseUrl, 'horariopeluqueros.json');
  final resp = await http.get(url);
  final horarios = jsonDecode(resp.body) as Map<String, dynamic>;

  String? horarioKey;
  for (var entry in horarios.entries) {
    if (entry.value['idUsuario'] == idUsuario) {
      horarioKey = entry.key;
      break;
    }
  }

  if (horarioKey != null) {
    final updatedHorario = {
      'horaEntrada': horaEntrada,
      'horaSalida': horaSalida,
    };
    final url = Uri.https(_baseUrl, 'horariopeluqueros/$horarioKey/horarios/$dia.json');
    final resp = await http.patch(url, body: jsonEncode(updatedHorario));
    return resp.body;
  } else {
    return saveHorario(idUsuario, dia, horaEntrada, horaSalida);
  }
}
}