import 'package:abast_app/models/model.dart';
import 'package:flutter/material.dart';

class ListAbastTile extends StatefulWidget {
  const ListAbastTile(this.abast, {super.key});

  final Abast abast;

  @override
  State<ListAbastTile> createState() => _ListAbastTileState();
}

class _ListAbastTileState extends State<ListAbastTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(),
    );
  }
}
