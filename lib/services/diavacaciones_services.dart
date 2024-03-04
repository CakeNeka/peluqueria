import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peluqueria/models/diavacaciones.dart';

class DiaVacacionesServices extends ChangeNotifier {
  final String _baseUrl =
      "pelu-siemens-default-rtdb.europe-west1.firebasedatabase.app";
  final List<DiaVacaciones> diavacaciones = [];

  Future<String> saveDiaVacaciones(DiaVacaciones dia) async {
    final url = Uri.https(_baseUrl, 'diasvacaciones.json');
    final resp = await http.post(url, body: dia.toRawJson());
    return resp.body;
  }

  Future<List<DiaVacaciones>> loadDiaVacaciones() async {
    notifyListeners();

    final url = Uri.https(_baseUrl, 'diasvacaciones.json');
    final resp = await http.get(url);

    final Map<String, dynamic> diasMap = json.decode(resp.body);

    this.diavacaciones.clear();

    diasMap.forEach((key, value) {
      final tempDia = DiaVacaciones.fromJson(value);
      tempDia.id = key;
      this.diavacaciones.add(tempDia);
    });

    return diavacaciones;
  }

  Future<List<DiaVacaciones>> getFechaByIdUsuario(String idUsuario) async {
    List<DiaVacaciones> vacaciones = await loadDiaVacaciones();
    return vacaciones
        .where((vacacion) => vacacion.idUsuario == idUsuario)
        .toList();
  }
}
