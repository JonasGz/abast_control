import 'dart:io';

import 'package:abast_app/components/button.dart';
import 'package:abast_app/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_storage/firebase_storage.dart';

class SignupForm extends StatefulWidget {
  SignupForm({super.key});

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

    return Container(
      padding: const EdgeInsets.only(left: 50.0, right: 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          imagePath != null
              ? Stack(
                  children: [
                    Image.file(
                      width: 200,
                      height: 200,
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
          SizedBox(
            height: 20.0,
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
                const SizedBox(
                  height: 20.0,
                ),
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
                            var fileReference = reference.child("$email.jpg");
                            var imageFile = File(imagePath!);
                            if (!imageFile.existsSync()) {
                              print('Arquivo não encontrado: $imagePath');
                              return;
                            }
                            var uploadFile =
                                await fileReference.putFile(imageFile);
                            print('UPOU A IMAGEM!');
                            Navigator.pushNamed(context, '/abast-page');
                          } on FirebaseException catch (e) {
                            print('Erro FirebaseStorage');
                          }
                        } else {}
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 40.0,
                  child: Button(
                    'Já possui conta?',
                    () {
                      Navigator.pushNamed(context, '/login');
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
