import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peluqueria/models/usuario.dart';

class UsuariosServices extends ChangeNotifier {
  final String _baseUrl =
      "pelu-siemens-default-rtdb.europe-west1.firebasedatabase.app";

  Future<String> saveUsuario(Usuario usuario) async {
    final url = Uri.https(_baseUrl, 'usuarios.json');
    final resp = await http.post(url, body: usuario.toRawJson());
    return resp.body;
  }
}
