import 'package:flutter/material.dart';
import 'package:peluqueria/models/usuario.dart';
import 'package:peluqueria/providers/register_form_provider.dart';
import 'package:peluqueria/services/usuarios_services.dart';
import 'package:peluqueria/widgets/widgets.dart';
import 'package:peluqueria/providers/login_form_provider.dart';
import 'package:peluqueria/services/auth_services.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: ChangeNotifierProvider(
              create: (_) => RegisterFormProvider(),
              child: _RegisterForm(),
            ),
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  void register(RegisterFormProvider registerForm, context) async {
    if (registerForm.isLoading) return;
    FocusScope.of(context).unfocus();
    final authService = Provider.of<AuthService>(context, listen: false);
    final usuariosService =
        Provider.of<UsuariosServices>(context, listen: false);
    if (!registerForm.isValidForm()) return;

    registerForm.isLoading = true;

    final String? errorMessage =
        await authService.createUser(registerForm.email, registerForm.password);
    if (errorMessage == null) {
      String response =
          await usuariosService.saveUsuario(generateUsuario(registerForm));
      registerForm.isLoading = false;
      Navigator.pushReplacementNamed(context, 'login');
    } else {
      print(errorMessage);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('No se ha podido crear la cuenta, $errorMessage'),
          );
        },
      );
      registerForm.isLoading = false;
    }
  }
  // 9Wg3Vt5DVEYhk6f1gTyBamjQ6Z42
  // adgnJIGQ58a35Zfd0ZC3rYSo71A3

  Usuario generateUsuario(RegisterFormProvider registerForm) {
    return Usuario(
      email: registerForm.email,
      genero: registerForm.genero,
      id: registerForm.id,
      nombre: registerForm.nombre,
      rol: registerForm.rol,
      telefono: registerForm.telefono,
      verificado: registerForm.verificado,
    );
  }

  _RegisterForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final RegisterFormProvider registerForm =
        Provider.of<RegisterFormProvider>(context);
    return Form(
      key: registerForm.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          const SizedBox(height: 40),
          // Logo
          const Icon(
            Icons.heart_broken,
            size: 100,
          ),
          const SizedBox(height: 40),
          const Text(
            "Regístrate en peluquería",
            style: TextStyle(fontSize: 16),
          ),

          const SizedBox(height: 40),

          // username
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              obscureText: false,
              decoration: const InputDecoration(
                hintText: "Email",
                suffixIcon: Icon(Icons.mail_rounded),
              ),
              onChanged: (value) => registerForm.email = value,
              validator: (value) {
                String pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp = new RegExp(pattern);

                return regExp.hasMatch(value ?? '')
                    ? null
                    : 'Introduce un correo válido';
              },
            ),
          ),

          const SizedBox(height: 10),

          // Password
          PasswordTextField(
            onChanged: (value) => registerForm.password = value,
            validator: (value) {
              return (value != null && value.length >= 6)
                  ? null
                  : "La contraseña debe tener al menos 6 caracteres";
            },
          ),

          const SizedBox(height: 10),

          // nombre completo
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextFormField(
              keyboardType: TextInputType.name,
              textCapitalization: TextCapitalization.words,
              obscureText: false,
              decoration: const InputDecoration(
                hintText: "Nombre",
                suffixIcon: Icon(Icons.person),
              ),
              onChanged: (value) => registerForm.nombre = value,
              validator: (value) {
                return (value ?? '').length >= 2
                    ? null
                    : "Introduce un nombre válido";
              },
            ),
          ),

          const SizedBox(height: 30),
          // Sign in
          SimpleButton(
            onTap: () => register(registerForm, context),
            text: registerForm.isLoading ? "Espere" : "Registrarse",
          ),
          const SizedBox(height: 30),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Expanded: Ocupa Toda la fila
                Expanded(
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.grey[400],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "¿Ya tienes cuenta?",
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pushReplacementNamed(context, 'login'),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Inicia sesión",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.grey[400],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
