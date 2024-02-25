import 'package:flutter/material.dart';
import 'package:peluqueria/components/components.dart';

class GestionPeluquerosScreen extends StatelessWidget {
  const GestionPeluquerosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestion de peluqueros'),
        backgroundColor: Colors.black87,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          if (index == 0) {
            return const Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Buscar',
                  labelStyle: TextStyle(color: Colors.black87),
                  prefixIcon: Icon(Icons.search),
                  fillColor: Colors.white54,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    borderSide: BorderSide(color: Colors.black87),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    borderSide: BorderSide(color: Colors.black87),
                  ),
                ),
              ),
            );
          } else {
            return UserCard();
          }
        },
      ),
      endDrawer: DefaultDrawer(selectedIndex: 2),
    );
  }
}
