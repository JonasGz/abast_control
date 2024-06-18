import 'dart:io';

import 'package:abast_app/components/drawer_component.dart';
import 'package:abast_app/components/signup_form.dart';
import 'package:abast_app/components/take_picture.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

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
        title: Text('Signup Page'),
      ),
      drawer: DrawerComponent(),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            imagePath != null ? Stack(
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
            ) : IconButton(onPressed: () async {
                Object? result = await Navigator.of(context).pushNamed('/take-picture-page');
                if (result != null) {
                  setState(() {
                    imagePath = result as String;
                  },);
                }
            }, icon: const Icon(Icons.camera_alt),),
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
