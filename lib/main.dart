import 'package:abast_app/pages/home_page.dart';
import 'package:abast_app/pages/login_page.dart';
import 'package:abast_app/pages/signup_page.dart';
import 'package:abast_app/providers/abast_provider.dart';
import 'package:abast_app/providers/auth_provider.dart';
import 'package:abast_app/routes/routes.dart';
import 'package:abast_app/providers/location_provider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

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
    final routes = Routes(context: context);
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
          '/': routes.home(context),
          '/login': routes.login(context),
          '/signup': routes.signUp(context),
          '/abast-page': routes.abastPage(context),
          '/abast-add-page': routes.abastAddPage(context),
          '/take-picture-page': routes.takePicturePage(context),
        },
        title: 'Abastecimento Control',
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
