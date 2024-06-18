import 'package:abast_app/components/button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:abast_app/providers/auth_provider.dart';

class LoginForm extends StatefulWidget {
  LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    
                  },
                  child: const Text(
                    'Esqueceu sua senha?',
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            SizedBox(
              width: double.infinity,
              height: 60.0,
              child: Button('Acessar', () {
              final email = emailController.text;
              final password = passwordController.text;
              authProvider.signIn(email, password).then((response) => {
                if (response) {
                  Navigator.of(context).pushNamed('/abast-page')
                },
              });
              },),),
            SizedBox(
              width: double.infinity,
              height: 60.0,
              child: Button('Não possui cadastro?', () {
                Navigator.pushNamed(context, '/signup');
              }),
            ),
          ],
        ),
      ),
    );
  }
}
