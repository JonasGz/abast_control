import 'package:abast_app/components/abast_list.dart';
import 'package:abast_app/components/drawer_component.dart';
import 'package:flutter/material.dart';

class AbastPage extends StatelessWidget {
  const AbastPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Abast Page'),
      ),
      drawer: DrawerComponent(),
      body: AbastList(),
    );
  }
}
