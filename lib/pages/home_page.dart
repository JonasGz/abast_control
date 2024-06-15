import 'package:abast_app/components/button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Button(
              'Logar',
              () {
                Navigator.pushNamed(context, '/login');
              },
            ),
            Button(
              'Cadastrar',
              () {
                Navigator.pushNamed(context, '/signup');
              },
            )
          ],
        ),
      ),
    );
  }
}
