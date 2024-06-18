import 'package:abast_app/pages/abast_add_page.dart';
import 'package:abast_app/pages/abast_page.dart';
import 'package:abast_app/pages/home_page.dart';
import 'package:abast_app/pages/login_page.dart';
import 'package:abast_app/pages/signup_page.dart';
import 'package:flutter/material.dart';

class Routes {
  final BuildContext context;
  Routes({required this.context});

  home(context) {
    return (context) => const HomePage();
  }

  login(context) {
    return (context) => const LoginPage();
  }

  signUp(context) {
    return (context) => const SignupPage();
  }

  abastPage(context) {
    return (context) => const AbastPage();
  }

  abastAddPage(context) {
    return (context) =>const AbastAddPage();
  }
}
