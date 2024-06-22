import 'package:abast_app/models/model.dart';
import 'package:abast_app/services/geolocator_service.dart';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

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
    final location = context.watch<GeolocatorService>();
    // final lat = location.lat;
    // final long = location.long;
    return ListTile(
      title: Text(combustivel),
      // subtitle: Text('Localização: ${lat.toString()}, ${long.toString()}'),
      trailing: Text(
        valor,
        style: const TextStyle(fontSize: 16.0),
      ),
    );
  }
}
