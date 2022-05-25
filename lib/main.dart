import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:pizza_order/helpers/cache_helper.dart';
import 'package:pizza_order/providers/auth_provider.dart';
import 'package:pizza_order/providers/cart_provider.dart';
import 'package:pizza_order/providers/dish_details_provider.dart';
import 'package:pizza_order/providers/main_provider.dart';
import 'package:pizza_order/providers/location_provider.dart';
import 'package:pizza_order/providers/map_provider.dart';
import 'package:pizza_order/views/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LocationProvider()..getLocation()),
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => MainProvider()..getFavoriteDishes()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => MapProvider()),
        ChangeNotifierProvider(create: (context) => DishDetailsProvider()),
      ],
      child: MaterialApp(
        title: 'Pizza Order',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.amber,
          primaryColor: const Color(0xFFFFC56B),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
