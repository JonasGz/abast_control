import 'package:abast_app/models/model.dart';
import 'package:abast_app/providers/abast_provider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Testing model abast', () {
    test('Testing add abastecimento', () {
      // Arrange
      String combustivel = 'gasolina';
      double valor = 20.0;
      var instanceObject = Abast(combustivel, valor);
      var instanceProvider = AbastProvider();
      var abasts = instanceProvider.getAbasts();

      // Action

      // verifica se lista abast = 0

      // add abast
      instanceProvider.addAbast(instanceObject);

      // Assert

      // verifica se add abast
      expect(abasts?.contains(instanceObject), true);
      expect((abasts?.length == 1), true);
    });

    test('Testing remove abastecimento', () {
      // Arrange
      String combustivel = 'gasolina';
      double valor = 20.0;
      var instanceObject = Abast(combustivel, valor);
      var instanceProvider = AbastProvider();
      var abasts = instanceProvider.getAbasts();

      // Action

      // add abast
      instanceProvider.addAbast(instanceObject);

      // Assert

      // verifica se add abast
      expect(abasts?.contains(instanceObject), true);
      expect((abasts?.length == 1), true);

      // remove abast
      instanceProvider.removeAbast(instanceObject);

      // verifica se removeu abast
      expect(abasts?.contains(instanceObject), false);
      expect((abasts?.length == 0), true);
    });
  });
}
