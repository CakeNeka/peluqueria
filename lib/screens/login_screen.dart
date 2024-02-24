import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 40),
              // Logo
              Icon(
                Icons.cut_outlined,
                size: 100,
              ),
              SizedBox(height: 40),
              Text(
                "Te damos la bienvenida de nuevo :D",
                style: TextStyle(fontSize: 16),
              ),

              SizedBox(height: 40),

              TextField(
                decoration: InputDecoration(),
              ),
              // username

              // password
            ],
          ),
        ),
      ),
    );
  }
}
