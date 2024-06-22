import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class GeolocatorService extends ChangeNotifier {
  double lat = 0.0;
  double long = 0.0;
  String? erro;

  GeolocatorService() {
    getAdress();
  }

  getAdress() async {
    try {
      var key = 'AIzaSyBF2MKsXdIkom5jOsdVPZ8iHHl4oTF7fEk';
      var lati = GeolocatorService().lat.toString();
      var longi = GeolocatorService().long.toString();
      var url = Uri.https('maps.googleapis.com',
          'maps/api/geocode/json?latlng=${lati},${longi}&key=${key}');
      var response = await http.get(url);
      var corpo = response.body;
      if (response.statusCode == 200) {
        var dados = jsonDecode(corpo);
        var endereco = dados['result'][0]['formatted_address'];
        print(endereco);
      } else {
        erro = 'Erro ao obter endereço';
      }
    } catch (e) {
      erro = e.toString();
    }
  }

  getPosition() async {
    try {
      Position posicao = await _determinePosition();
      lat = posicao.latitude;
      long = posicao.longitude;
    } catch (e) {
      erro = e.toString();
    }
    notifyListeners();
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}
