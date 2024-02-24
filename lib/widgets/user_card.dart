import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Container(
        width: double.infinity,
        height: 100,
        margin: const EdgeInsets.only(top: 10, bottom: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 7),
                blurRadius: 10,
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Icon(Icons.account_circle, size: 80),
            const SizedBox(width: 10),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Cliente 1',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                Text(
                  'Rol: cliente',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ],
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.only(right: 8.0),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Ver',
                    style: TextStyle(color: Colors.black, fontSize: 18)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
