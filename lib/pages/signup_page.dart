import 'package:abast_app/components/drawer_component.dart';
import 'package:abast_app/components/signup_form.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Signup Page'),
      ),
      drawer: DrawerComponent(),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.lock,
              size: 100.0,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Seja bem-vindo!',
              style: TextStyle(
                color: Colors.black54,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            SignupForm(),
          ],
        ),
      ),
    );
  }
}
