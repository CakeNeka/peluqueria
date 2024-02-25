import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:peluqueria/widgets/password_text_field.dart';
import 'package:peluqueria/widgets/simple_button.dart';
import 'package:peluqueria/providers/login_form_provider.dart';
import 'package:peluqueria/services/auth_services.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  void testBiometrics() async {
    LocalAuthentication auth = LocalAuthentication();
    bool deviceSupported = await auth.isDeviceSupported();
    print("Device supported: $deviceSupported");
    List<BiometricType> availableBiometrics =
        await auth.getAvailableBiometrics();
    print(availableBiometrics);
    try {
      bool authenticated = await auth.authenticate(
          localizedReason:
              '¡Holis! Puedes usar tu huella para acceder a la aplicación',
          options: const AuthenticationOptions(
            stickyAuth: true, // No falla si la aplicación pasa a segundo plano
            biometricOnly: true, // Impide uso de PIN
          ));
    } on PlatformException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    testBiometrics();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: ChangeNotifierProvider(
              create: (_) => LoginFormProvider(),
              child: _LoginForm(),
            ),
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  void login(LoginFormProvider loginForm, context) async {
    if (loginForm.isLoading) return;
    FocusScope.of(context).unfocus();
    final authService = Provider.of<AuthService>(context, listen: false);
    if (!loginForm.isValidForm()) return;

    loginForm.isLoading = true;

    // TODO: validar si el login es correcto
    final String? errorMessage =
        await authService.login(loginForm.email, loginForm.password);
    if (errorMessage == null) {
      Navigator.pushReplacementNamed(context, 'home');
    } else {
      // Mostrar error en la terminal
      print(errorMessage);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Credenciales Incorrectas, $errorMessage'),
          );
        },
      );
      loginForm.isLoading = false;
    }
  }

  _LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final LoginFormProvider loginForm = Provider.of<LoginFormProvider>(context);
    return Form(
      key: loginForm.formKey,
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
            "Te damos la bienvenida de nuevo :D",
            style: TextStyle(fontSize: 16),
          ),

          const SizedBox(height: 40),

          // username
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              obscureText: false,
              decoration: const InputDecoration(
                hintText: "Email",
                suffixIcon: Icon(Icons.person),
              ),
              onChanged: (value) => loginForm.email = value,
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

          // password
          PasswordTextField(
            onChanged: (value) => loginForm.password = value,
            validator: (value) {
              return (value != null && value.length >= 6)
                  ? null
                  : "La contraseña debe tener al menos 6 caracteres";
            },
          ),

          const SizedBox(height: 30),
          // Sign in
          SimpleButton(
            onTap: () => login(loginForm, context),
            text: loginForm.isLoading ? "Espere" : "Login",
          ),
          const SizedBox(height: 30),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
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
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "¿No eres miembro?",
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ),
                GestureDetector(
                  onTap: () =>
                      Navigator.pushReplacementNamed(context, 'register'),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Regístrate",
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
