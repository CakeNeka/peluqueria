import 'package:flutter/material.dart';
import 'package:peluqueria/models/usuario.dart';

class ConnectedUserProvider extends ChangeNotifier {
  // Este usuario de prueba es para poder utilizar la aplicación
  // sin tener que pasar por la ventana de login
  // eliminar en la versión final
  Usuario activeUser = Usuario(
    email: "a",
    genero: "",
    id: "",
    nombre: "Usuario de prueba",
    rol: "Gerente",
    telefono: "",
    verificado: false,
  );

  String getActiveUserRol() {
    return activeUser.rol;
  }

  // Método llamado en login_screen si el login se realiza correctamente
  void setActiveUser(Usuario user) {
    activeUser = user;
  }
}
