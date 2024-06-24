import 'dart:io';

import 'package:abast_app/components/button.dart';
import 'package:abast_app/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_storage/firebase_storage.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String? imagePath;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = context.watch<AuthProvider>();
    var screenSize = MediaQuery.of(context).size.height;

    return Container(
      padding: const EdgeInsets.only(left: 50.0, right: 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          imagePath != null
              ? Stack(
                  children: [
                    Image.file(
                      width: 150,
                      height: 100,
                      File(imagePath!),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          imagePath = null;
                        });
                      },
                      icon: const Icon(Icons.delete),
                    )
                  ],
                )
              : IconButton(
                  onPressed: () async {
                    Object? result = await Navigator.of(context)
                        .pushNamed('/take-picture-page');
                    if (result != null) {
                      setState(
                        () {
                          imagePath = result as String;
                        },
                      );
                    }
                  },
                  icon: const Icon(Icons.camera_alt),
                ),
          const SizedBox(
            height: 10.0,
          ),
          Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    return null;
                  },
                ),
                const SizedBox(
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
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                if (screenSize <= 667)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Button(
                        'Register',
                        () async {
                          if (_formKey.currentState!.validate()) {
                            final email = emailController.text;
                            final password = passwordController.text;
                            bool response =
                                await authProvider.signUp(email, password);
                            if (response) {
                              try {
                                var storage = FirebaseStorage.instance;
                                var reference = storage.ref();
                                var fileReference =
                                    reference.child("$email.jpg");
                                var imageFile = File(imagePath!);
                                if (!imageFile.existsSync()) {
                                  print('Arquivo não encontrado: $imagePath');
                                  return;
                                }

                                await fileReference.putFile(imageFile);
                                print('Upload com sucesso!');
                                Navigator.pushNamed(context, '/abast-page');
                              } on FirebaseException catch (e) {
                                print('Erro FirebaseStorage: $e');
                              }
                            }
                          }
                        },
                      ),
                      Button(
                        'Account?',
                        () {
                          Navigator.pushNamed(context, '/login');
                        },
                      ),
                    ],
                  )
                else
                  Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 60.0,
                        child: Button(
                          'Cadastrar',
                          () async {
                            if (_formKey.currentState!.validate()) {
                              final email = emailController.text;
                              final password = passwordController.text;
                              bool response =
                                  await authProvider.signUp(email, password);
                              if (response) {
                                try {
                                  var storage = FirebaseStorage.instance;
                                  var reference = storage.ref();
                                  var fileReference =
                                      reference.child("$email.jpg");
                                  var imageFile = File(imagePath!);
                                  if (!imageFile.existsSync()) {
                                    print('Arquivo não encontrado: $imagePath');
                                    return;
                                  }

                                  await fileReference.putFile(imageFile);
                                  print('Upload com sucesso!');
                                  Navigator.pushNamed(context, '/abast-page');
                                } on FirebaseException catch (e) {
                                  print('Erro FirebaseStorage: $e');
                                }
                              } else {}
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 50.0,
                        child: Button(
                          'Já possui conta?',
                          () {
                            Navigator.pushNamed(context, '/login');
                          },
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
