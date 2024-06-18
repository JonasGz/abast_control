import 'package:abast_app/components/button.dart';
import 'package:abast_app/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupForm extends StatefulWidget {
  SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = context.watch<AuthProvider>();

    return Container(
      padding: const EdgeInsets.only(left: 50.0, right: 50.0),
      height: 300.0,
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                fillColor: Colors.white70,
                filled: true,
              ),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: 'Senha',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                fillColor: Colors.white70,
                filled: true,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            SizedBox(
              width: double.infinity,
              height: 60.0,
              child: Button(
                'Cadastrar',
                () {
                  final email = emailController.text;
                  final password = passwordController.text;
                  authProvider.signUp(email, password).then((response) => {
                    if (response) {
                      Navigator.pushNamed(context, '/abast-page')
                    }
                  });
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 60.0,
              child: Button('Já possui conta?', () {
                Navigator.pushNamed(context, '/login');
              }),
            ),
          ],
        ),
      ),
    );
  }
}
