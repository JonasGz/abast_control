import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {

      Future<bool> signUp(String email, String password) async {
      try {
        final credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: email, password: password);
                return true;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
        return false;
      }
    }

      Future<bool> signIn(String email, String password) async {
      try {
        final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                email: email, password: password);
                return true;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
        return false;
      }
    }
}