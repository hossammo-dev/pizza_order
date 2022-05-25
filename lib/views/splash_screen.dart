import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pizza_order/constants.dart';
import 'package:pizza_order/helpers/cache_helper.dart';
import 'package:pizza_order/shared/shared.dart';
import 'package:pizza_order/views/auth/login_and_register_screen.dart';
import 'package:pizza_order/views/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Constants.userId = CacheHelper.get('user_id') ?? '';
    Timer(
      const Duration(seconds: 7),
      () {
        navigateAndRemove(
          context,
          page: (Constants.userId == '')
              ? const LoginAndRegisterScreen()
              : const HomeScreen(),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(Constants.pizza, repeat: false),
      ),
    );
  }
}
