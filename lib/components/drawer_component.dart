import 'package:abast_app/providers/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerComponent extends StatelessWidget {
  const DrawerComponent({super.key});

  bool checkUserLoggedIn() {
    final user = firebase_auth.FirebaseAuth.instance.currentUser;
    return user != null;
  }

  @override
  Widget build(BuildContext context) {
    final loggedIn = checkUserLoggedIn();
    AuthProvider authProvider = context.watch<AuthProvider>();
    print(loggedIn);
    return Drawer(
      child: ListView(children: [
        Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.close))
          ],
        ),
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Home'),
          onTap: () {
            Navigator.pushNamed(context, '/');
          },
        ),
        if (!checkUserLoggedIn())
          ListTile(
            leading: const Icon(Icons.app_registration_rounded),
            title: const Text('Sign Up'),
            onTap: () {
              Navigator.pushNamed(context, '/signup');
            },
          ),
        if (checkUserLoggedIn()) ...[
          ListTile(
            leading: const Icon(Icons.key),
            title: const Text('Abastecimentos'),
            onTap: () {
              Navigator.pushNamed(context, '/abast-page');
            },
          ),
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text('Add Abast'),
            onTap: () {
              Navigator.pushNamed(context, '/abast-add-page');
            },
          ),
        ],
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text('Logout'),
          onTap: () {
            authProvider.signOut();
            Navigator.pushNamed(context, '/');
          },
        ),
      ]),
    );
  }
}
