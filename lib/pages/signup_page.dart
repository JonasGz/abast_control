import 'package:abast_app/components/drawer_component.dart';
import 'package:abast_app/components/signup_form.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text('Signup Page'),
      ),
      drawer: const DrawerComponent(),
      body: Container(
        alignment: Alignment.center,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SignupForm(),
          ],
        ),
      ),
    );
  }
}
