import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:pizza_order/providers/main_provider.dart';
import 'package:pizza_order/services/location_services.dart';
import 'package:pizza_order/views/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LocationServices()),
        ChangeNotifierProvider(create: (context) => MainProvider()),
      ],
      child: MaterialApp(
        title: 'Pizza Order',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
          primaryColor: Colors.redAccent,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
