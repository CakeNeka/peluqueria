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

  Future<Usuario?> getUsuarioById(String id) async {
    List<Usuario> users = await loadUsuarios();
    return users.where((u) => u.id == id).firstOrNull;
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

  Future<String> updateUsuarioHoraInicioLunes(
      String id, String horaInicio) async {
    final url = Uri.https(_baseUrl, 'usuarios/$id.json');

    final resp = await http.patch(url,
        body: jsonEncode({'horaentradalunes': horaInicio}));
    final decodedData = resp.body;

    return id;
  }

  Future<String> updateUsuarioHoraFinLunes(String id, String horaFin) async {
    final url = Uri.https(_baseUrl, 'usuarios/$id.json');

    final resp =
        await http.patch(url, body: jsonEncode({'horasalidalunes': horaFin}));
    final decodedData = resp.body;

    return id;
  }

  Future<String> updateUsuarioHoraInicioMartes(
      String id, String horaInicio) async {
    final url = Uri.https(_baseUrl, 'usuarios/$id.json');

    final resp = await http.patch(url,
        body: jsonEncode({'horaentradamartes': horaInicio}));
    final decodedData = resp.body;

    return id;
  }

  Future<String> updateUsuarioHoraFinMartes(String id, String horaFin) async {
    final url = Uri.https(_baseUrl, 'usuarios/$id.json');

    final resp =
        await http.patch(url, body: jsonEncode({'horasalidamartes': horaFin}));
    final decodedData = resp.body;

    return id;
  }

  Future<String> updateUsuarioHoraInicioMiercoles(
      String id, String horaInicio) async {
    final url = Uri.https(_baseUrl, 'usuarios/$id.json');

    final resp = await http.patch(url,
        body: jsonEncode({'horaentradamiercoles': horaInicio}));
    final decodedData = resp.body;

    return id;
  }

  Future<String> updateUsuarioHoraFinMiercoles(
      String id, String horaFin) async {
    final url = Uri.https(_baseUrl, 'usuarios/$id.json');

    final resp = await http.patch(url,
        body: jsonEncode({'horasalidamiercoles': horaFin}));
    final decodedData = resp.body;

    return id;
  }

  Future<String> updateUsuarioHoraInicioJueves(
      String id, String horaInicio) async {
    final url = Uri.https(_baseUrl, 'usuarios/$id.json');

    final resp = await http.patch(url,
        body: jsonEncode({'horaentradajueves': horaInicio}));
    final decodedData = resp.body;

    return id;
  }

  Future<String> updateUsuarioHoraFinJueves(String id, String horaFin) async {
    final url = Uri.https(_baseUrl, 'usuarios/$id.json');

    final resp =
        await http.patch(url, body: jsonEncode({'horasalidajueves': horaFin}));
    final decodedData = resp.body;

    return id;
  }

  Future<String> updateUsuarioHoraInicioViernes(
      String id, String horaInicio) async {
    final url = Uri.https(_baseUrl, 'usuarios/$id.json');

    final resp = await http.patch(url,
        body: jsonEncode({'horaentradaviernes': horaInicio}));
    final decodedData = resp.body;

    return id;
  }

  Future<String> updateUsuarioHoraFinViernes(String id, String horaFin) async {
    final url = Uri.https(_baseUrl, 'usuarios/$id.json');

    final resp =
        await http.patch(url, body: jsonEncode({'horasalidaviernes': horaFin}));
    final decodedData = resp.body;

    return id;
  }

  Future<String> updateUsuarioHoraInicioSabado(
      String id, String horaInicio) async {
    final url = Uri.https(_baseUrl, 'usuarios/$id.json');

    final resp = await http.patch(url,
        body: jsonEncode({'horaentradasabado': horaInicio}));
    final decodedData = resp.body;

    return id;
  }

  Future<String> updateUsuarioHoraFinSabado(String id, String horaFin) async {
    final url = Uri.https(_baseUrl, 'usuarios/$id.json');

    final resp =
        await http.patch(url, body: jsonEncode({'horasalidasabado': horaFin}));
    final decodedData = resp.body;

    return id;
  }

  Future<String> updateUsuarioHoraInicioDomingo(
      String id, String horaInicio) async {
    final url = Uri.https(_baseUrl, 'usuarios/$id.json');

    final resp = await http.patch(url,
        body: jsonEncode({'horaentradadomingo': horaInicio}));
    final decodedData = resp.body;

    return id;
  }

  Future<String> updateUsuarioHoraFinDomingo(String id, String horaFin) async {
    final url = Uri.https(_baseUrl, 'usuarios/$id.json');

    final resp =
        await http.patch(url, body: jsonEncode({'horasalidadomingo': horaFin}));
    final decodedData = resp.body;

    return id;
  }
}
