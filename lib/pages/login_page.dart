import 'package:abast_app/components/login_form.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        centerTitle: true,
        title: Text('Login Screen'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/');
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.lock,
              size: 100.0,
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Seja bem-vindo!',
              style: TextStyle(
                color: Colors.black54,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            LoginForm(),
          ],
        ),
      ),
    );
  }
}
