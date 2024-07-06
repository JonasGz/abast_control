import 'package:cloud_firestore/cloud_firestore.dart';

class SaveData {
  Future<void> addUser(email, user) {
    return user.doc(email).set(({
          'email:': email,
        }));
  }

  Future<void> addAbastDb(email, user, combustivel, valor) {
    return user.doc(email).set((
      {
        'email:': email,
        'combustivel:': combustivel,
        'valor': valor,
      },
    ));
  }
}
