import 'package:abast_app/models/model.dart';
import 'package:flutter/material.dart';

class AbastProvider extends ChangeNotifier {
  List<Abast>? abastList = [];

  void addAbast(Abast abast) {
    abastList?.add(abast);
    notifyListeners();
  }

  void removeAbast(Abast abast) {
    abastList?.remove(abast);
    notifyListeners();
  }
}
