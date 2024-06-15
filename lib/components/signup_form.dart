import 'package:abast_app/components/button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupForm extends StatelessWidget {
  SignupForm({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void signUp() async {
      try {
        final credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailController.text, password: passwordController.text);
        Navigator.pushNamed(context, '/');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    }

    return Container(
      padding: const EdgeInsets.only(left: 50.0, right: 50.0),
      height: 300.0,
      child: Form(
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
                  signUp();
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
