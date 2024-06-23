import 'package:abast_app/components/drawer_component.dart';
import 'package:abast_app/components/login_form.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      drawer: DrawerComponent(),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(
              Icons.lock,
              size: 70.0,
            ),
            LoginForm(),
          ],
        ),
      ),
    );
  }
}
