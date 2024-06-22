import 'package:abast_app/components/button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:greetingpk/greetingpk.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget? _greetingWidget;

  @override
  void initState() {
    super.initState();
    _loadGreeting();
  }

  Future<void> _loadGreeting() async {
    Greetings greetings = Greetings();
    Widget greetingWidget = await greetings.giveGreetings(DateTime.now().hour);
    if (greetingWidget is Text) {
      greetingWidget = Text(
        greetingWidget.data ?? '',
        style: const TextStyle(
          fontSize: 20,
        ),
      );
    }
    setState(() {
      _greetingWidget = greetingWidget;
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.oil_barrel,
              size: 130.0,
            ),
            SizedBox(
              height: 20.0,
            ),
            _greetingWidget ?? const CircularProgressIndicator(),
            SizedBox(
              height: 20.0,
            ),
            if (user == null)
              Column(
                children: [
                  Button(
                    'Logar',
                    () {
                      Navigator.pushNamed(context, '/login');
                    },
                  ),
                  Button(
                    'Cadastrar',
                    () {
                      Navigator.pushNamed(context, '/signup');
                    },
                  )
                ],
              )
            else
              Column(children: [
                Button(
                  'Abast List',
                  () {
                    Navigator.pushNamed(context, '/abast-page');
                  },
                ),
                Button(
                  'Add Abast',
                  () {
                    Navigator.pushNamed(context, '/abast-add-page');
                  },
                ),
                Button('Logout', () {
                  FirebaseAuth.instance.signOut();
                })
              ]),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
