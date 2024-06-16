import 'package:abast_app/components/list_abast_tile.dart';
import 'package:abast_app/models/model.dart';
import 'package:abast_app/providers/abast_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AbastList extends StatelessWidget {
  const AbastList({super.key});

  @override
  Widget build(BuildContext context) {
    final abastProvider = context.watch<AbastProvider>();
    final List<Abast>? listaAbast = abastProvider.abastList;
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: listaAbast?.length,
          itemBuilder: (context, index) {
            Abast abast = listaAbast[index];
            return ListAbastTile(abast);
          },
        ),
      ),
    );
  }
}
