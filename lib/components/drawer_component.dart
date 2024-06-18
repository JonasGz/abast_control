import 'package:flutter/material.dart';

class DrawerComponent extends StatelessWidget {
  const DrawerComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                child: Text('Home'),
                onTap: () {
                  Navigator.pushNamed(context, '/');
                },
              ),
              GestureDetector(
                child: Text('Signup'),
                onTap: () {
                  Navigator.pushNamed(context, '/signup');
                },
          ),
              GestureDetector(
                child: Text('Abastecimentos'),
                onTap: () {
                  Navigator.pushNamed(context, '/abast-page');
              },
          ),
              GestureDetector(
                child: Text('Add Abastecimento'),
                onTap: () {
                  Navigator.pushNamed(context, '/abast-add-page');
              },
          ),
            ],
          ),
          )
        ],
      ),
    );
  }
}