import 'package:flutter/cupertino.dart';
import 'package:pizza_order/providers/auth_provider.dart';
import 'package:pizza_order/providers/cart_provider.dart';
import 'package:pizza_order/providers/dish_details_provider.dart';
import 'package:pizza_order/providers/main_provider.dart';
import 'package:pizza_order/providers/location_provider.dart';
import 'package:pizza_order/providers/map_provider.dart';
import 'package:provider/provider.dart';

class Constants {
  static String userId = '';

  static String pizza = 'assets/animations/pizza.json';
  static String pizzaBw = 'assets/animations/pizza_b&w.json';
  static String emptyCart = 'assets/animations/empty_cart.json';

  static MainProvider mainProvider(BuildContext context,
          {bool listen = false}) =>
      Provider.of<MainProvider>(context, listen: listen);

  static AuthProvider authProvider(BuildContext context,
          {bool listen = false}) =>
      Provider.of<AuthProvider>(context, listen: listen);

  static CartProvider cartProvider(BuildContext context,
          {bool listen = false}) =>
      Provider.of<CartProvider>(context, listen: listen);

  static LocationProvider locationProvider(BuildContext context,
          {bool listen = false}) =>
      Provider.of<LocationProvider>(context, listen: listen);

  static MapProvider mapProvider(BuildContext context, {bool listen = false}) =>
      Provider.of<MapProvider>(context, listen: listen);

  static DishDetailsProvider dishDetailsProvider(BuildContext context,
          {bool listen = false}) =>
      Provider.of<DishDetailsProvider>(context, listen: listen);

  static Size mediaQuery(BuildContext context) => MediaQuery.of(context).size;
}
