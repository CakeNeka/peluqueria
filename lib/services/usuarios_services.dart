import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peluqueria/models/usuario.dart';

class UsuariosServices extends ChangeNotifier {
  final String _baseUrl =
      "pelu-siemens-default-rtdb.europe-west1.firebasedatabase.app";
  final List<Usuario> usuario = [];

  Future<String> saveUsuario(Usuario usuario) async {
    final url = Uri.https(_baseUrl, 'usuarios.json');
    final resp = await http.post(url, body: usuario.toRawJson());
    return resp.body;
  }

Future<List<Usuario>> loadUsuarios() async {
  notifyListeners();

  final url = Uri.https(_baseUrl, 'usuarios.json');
  final resp = await http.get(url);

  final Map<String, dynamic> usuariosMap = json.decode(resp.body);

  this.usuario.clear();

  usuariosMap.forEach((key, value) {
    final tempUser = Usuario.fromJson(value);
    tempUser.id = key;
    this.usuario.add(tempUser);
  });

  return usuario;
}


  Future<Usuario?> getUsuarioByEmail(String email) async {
    List<Usuario> users = await loadUsuarios();
    return users.where((u) => u.email == email).firstOrNull;
  }

  Future<String> updateUsuario(Usuario usuario) async {
    final url = Uri.https(_baseUrl, 'usuarios/${usuario.id}.json');
    final resp = await http.put(url, body: usuario.toJson());
    final decodedData = resp.body;

    return usuario.id!;
  }

  Future<String> updateUsuarioRol(String id, String nuevoRol) async {
    final url = Uri.https(_baseUrl, 'usuarios/$id.json');

    final resp = await http.patch(url, body: jsonEncode({'rol': nuevoRol}));
    final decodedData = resp.body;

    return id;
  }
}
