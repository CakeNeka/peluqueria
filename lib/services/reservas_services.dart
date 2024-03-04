import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:peluqueria/models/reserva.dart';
import 'package:http/http.dart' as http;

class ReservasServices extends ChangeNotifier {
  final String _baseUrl =
      "pelu-siemens-default-rtdb.europe-west1.firebasedatabase.app";

  Future<List<Reserva>> loadReservas() async {
    notifyListeners();

    final url = Uri.https(_baseUrl, 'reservas.json');
    final resp = await http.get(url);

    final Map<String, dynamic> reservasMap = json.decode(resp.body);
    final List<Reserva> reservas = [];

    reservasMap.forEach((key, value) {
      final tempReserva = Reserva.fromJson(value);
      tempReserva.id = key;
      reservas.add(tempReserva);
    });

    return reservas;
  }
}
