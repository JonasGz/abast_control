import 'package:abast_app/components/abast_add.dart';
import 'package:abast_app/components/drawer_component.dart';
import 'package:flutter/material.dart';

class AbastAddPage extends StatelessWidget {
  const AbastAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Page'),
      ),
      drawer: DrawerComponent(),
      body: AbastAdd(),
    );
  }
}