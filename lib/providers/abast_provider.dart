import 'package:abast_app/models/model.dart';
import 'package:flutter/material.dart';

class AbastProvider extends ChangeNotifier {
  List<Abast>? abastList = [];
  List<Abast>? _abastList = [];

  late double soma;

  void addAbast(Abast abast) {
    abastList?.add(abast);
    notifyListeners();
  }

  void removeAbast(Abast abast) {
    abastList?.remove(abast);
    notifyListeners();
  }

  List<Abast>? getAbasts() {
    if (abastList != _abastList) {
      _abastList = abastList;
      notifyListeners();
    }
    return abastList;
  }
}
