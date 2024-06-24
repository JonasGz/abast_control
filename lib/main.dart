import 'package:abast_app/pages/home_page.dart';
import 'package:abast_app/pages/login_page.dart';
import 'package:abast_app/pages/signup_page.dart';
import 'package:abast_app/providers/abast_provider.dart';
import 'package:abast_app/providers/auth_provider.dart';
import 'package:abast_app/providers/location_provider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'components/take_picture.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

import 'pages/abast_add_page.dart';
import 'pages/abast_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AbastProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => GeolocatorService(),
        ),
      ],
      child: MaterialApp(
        routes: {
          '/': (context) => const HomePage(),
          '/login': (context) => LoginPage(),
          '/signup': (context) => SignupPage(),
          '/abast-page': (context) => const AbastPage(),
          '/abast-add-page': (context) => const AbastAddPage(),
          '/take-picture-page': (context) => const TakePicture(),
        },
        title: 'Abastecimento Control',
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
