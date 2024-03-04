import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:peluqueria/models/models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DiasServices extends ChangeNotifier {
  final String _baseUrl =
      "pelu-siemens-default-rtdb.europe-west1.firebasedatabase.app";
  List<Dia> dias = [];
  Dia? diaSeleccionado;

  DiasServices() {
    loadDias();
  }

  Future<List<Dia>> loadDias() async {
    notifyListeners();
    final url = Uri.https(_baseUrl, 'horariosemanal.json');
    final resp = await http.get(url);
    final Map<String, dynamic> diasMap = json.decode(resp.body);
    diasMap.forEach((key, value) {
      final tempDia = Dia.fromJson(value);
      tempDia.id = key;
      dias.add(tempDia);
    });
    notifyListeners();
    return dias;
  }

  Future<String> updateDia(Dia dia) async {
    final url = Uri.https(_baseUrl, 'horariosemanal/${dia.id}.json');
    final resp = await http.put(url, body: dia.toRawJson());
    final decodedData = resp.body;

    final index = dias.indexWhere((element) => element.id == dia.id);
    dias[index] = dia;

    notifyListeners();
    return dia.id!;
  }
}
