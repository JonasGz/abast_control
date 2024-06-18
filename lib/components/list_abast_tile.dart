import 'package:abast_app/models/model.dart';
import 'package:flutter/material.dart';

class ListAbastTile extends StatefulWidget {
  final Abast abast;
  const ListAbastTile(this.abast, {super.key});

  @override
  State<ListAbastTile> createState() => _ListAbastTileState();
}

class _ListAbastTileState extends State<ListAbastTile> {
  @override
  Widget build(BuildContext context) {
    String combustivel = widget.abast.combustivel.toString();
    String valor = widget.abast.valor.toString();
    return Container(
      child: ListTile(
        title: Text(combustivel),
        subtitle: Text(valor),
      ),
    );
  }
}
