import 'package:flutter/material.dart';

class DrawerComponent extends StatelessWidget {
  const DrawerComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Row(
            children: [
              IconButton(onPressed: () {
                Navigator.pop(context);
              }, icon: Icon(Icons.close))
            ],
          ),
           ListTile(
             leading: const Icon(Icons.home),
             title: const Text('Home'),
             onTap: () {
               Navigator.pushNamed(context, '/');
             },
           ),
           ListTile(
             leading: const Icon(Icons.app_registration_rounded),
             title: const Text('Sign Up'),
             onTap: () {
               Navigator.pushNamed(context, '/signup');
             },
           ),
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
        ]
          ),
      );
  }
}