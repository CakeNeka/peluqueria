import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:peluqueria/models/models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DiasFestivosServices extends ChangeNotifier {
  final String _baseUrl =
      "pelu-siemens-default-rtdb.europe-west1.firebasedatabase.app";
  List<DiaFestivo> diasFestivos = [];
  DiaFestivo? diaFestivoSeleccionado;

  DiasFestivosServices() {
    loadDiasFestivos();
  }

  Future<List<DiaFestivo>> loadDiasFestivos() async {
    notifyListeners();
    final url = Uri.https(_baseUrl, 'diasfestivos.json');
    final resp = await http.get(url);
    final Map<String, dynamic> diasFestivosMap = json.decode(resp.body);
    diasFestivosMap.forEach((key, value) {
      final tempDiaFestivo = DiaFestivo.fromJson(value);
      tempDiaFestivo.id = key;
      diasFestivos.add(tempDiaFestivo);
    });
    notifyListeners();
    return diasFestivos;
  }

  Future saveOrCreate(DiaFestivo diaFestivo) async {
    notifyListeners();
    if (diaFestivo.id == null) {
      await createDiaFestivo(diaFestivo);
    } else {
      await updateDiaFestivo(diaFestivo);
    }
  }

  Future<String> createDiaFestivo(DiaFestivo diaFestivo) async {
    final url = Uri.https(_baseUrl, 'diasfestivos.json');
    final resp = await http.post(url, body: diaFestivo.toRawJson());
    return resp.body;
  }

  Future<String> updateDiaFestivo(DiaFestivo diaFestivo) async {
    final url = Uri.https(_baseUrl, 'diasfestivos/${diaFestivo.id}.json');
    final resp = await http.put(url, body: diaFestivo.toRawJson());
    final decodedData = resp.body;

    final index =
        diasFestivos.indexWhere((element) => element.id == diaFestivo.id);
    diasFestivos[index] = diaFestivo;

    notifyListeners();
    return diaFestivo.id!;
  }
}
