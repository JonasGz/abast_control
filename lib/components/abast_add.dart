import 'package:abast_app/components/button.dart';
import 'package:abast_app/models/model.dart';
import 'package:abast_app/providers/abast_provider.dart';
import 'package:abast_app/providers/auth_provider.dart';
import 'package:abast_app/services/save_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AbastAdd extends StatelessWidget {
  const AbastAdd({super.key});

  @override
  Widget build(BuildContext context) {
    final abastProvider = context.watch<AbastProvider>();
    final combustivel = TextEditingController();
    final valor = TextEditingController();
    FirebaseAuth auth = FirebaseAuth.instance;
    final email = auth.currentUser!.email;

    CollectionReference user = FirebaseFirestore.instance.collection('users');

    return Container(
      padding: const EdgeInsets.all(40.0),
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: combustivel,
              decoration: const InputDecoration(
                labelText: 'Combustível',
              ),
            ),
            TextField(
              controller: valor,
              decoration: const InputDecoration(
                labelText: 'Valor',
              ),
            ),
            Button('Adicionar', () {
              final newCombustivel = combustivel.text;
              double newValor = double.parse(valor.text);
              final abast = Abast(newCombustivel, newValor);
              SaveData().addAbastDb(email, user, newCombustivel, newValor);
              abastProvider.addAbast(abast);
              Navigator.pushNamed(context, '/abast-page');
            })
          ],
        ),
      ),
    );
  }
}
