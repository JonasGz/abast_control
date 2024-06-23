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
    var screenSize = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.only(left: 50.0, right: 50.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextFormField(
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Insira um email';
                }
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            TextFormField(
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Insira uma senha';
                }
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {},
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
            if (screenSize <= 667)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Button(
                    'Login',
                    () {
                      if (_formKey.currentState!.validate()) {
                        final email = emailController.text;
                        final password = passwordController.text;
                        authProvider
                            .signIn(email, password)
                            .then((response) => {
                                  if (response)
                                    {
                                      Navigator.of(context)
                                          .pushNamed('/abast-page')
                                    },
                                });
                      }
                    },
                  ),
                  Button(
                    'Not register?',
                    () {
                      Navigator.pushNamed(context, '/signup');
                    },
                  ),
                ],
              )
            else
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 60.0,
                    child: Button(
                      'Acessar',
                      () {
                        if (_formKey.currentState!.validate()) {
                          final email = emailController.text;
                          final password = passwordController.text;
                          authProvider
                              .signIn(email, password)
                              .then((response) => {
                                    if (response)
                                      {
                                        Navigator.of(context)
                                            .pushNamed('/abast-page')
                                      },
                                  });
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50.0,
                    child: Button('Não possui cadastro?', () {
                      Navigator.pushNamed(context, '/signup');
                    }),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
