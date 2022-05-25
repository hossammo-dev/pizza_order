import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pizza_order/views/cart_screen.dart';

import '../constants.dart';

Future<bool?> defaultToast(String message) => Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.black,
      fontSize: 14,
      textColor: Colors.white,
    );

FloatingActionButton defaultFloatingActionButton(BuildContext context,
        {Color? btnColor, Color? badgeColor}) =>
    FloatingActionButton(
      onPressed: () => navigateTo(
        context,
        page: const CartScreen(),
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          const Icon(
            EvaIcons.shoppingBagOutline,
            color: Colors.black,
          ),
          if (Constants.cartProvider(context, listen: true).cartList.isNotEmpty)
            CircleAvatar(
              radius: 5,
              backgroundColor: badgeColor,
            ),
        ],
      ),
      backgroundColor: btnColor,
    );

MaterialButton defaultButton({
  required String title,
  required VoidCallback onPressed,
}) =>
    MaterialButton(
      onPressed: onPressed,
      elevation: 7.5,
      color: const Color(0xFFFFC56B),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      minWidth: 300,
      padding: const EdgeInsets.all(16),
      child: const Text(
        'Add to cart',
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
      ),
    );

//navigate to another page, but keep previous ones.
void navigateTo(
  BuildContext context, {
  required Widget page,
  PageTransitionType type = PageTransitionType.leftToRight,
}) =>
    Navigator.of(context).push(
      PageTransition(child: page, type: type),
    );

//navigate to another page and get rid of previous ones.
void navigateAndReplace(
  BuildContext context, {
  required Widget page,
  PageTransitionType type = PageTransitionType.bottomToTop,
}) =>
    Navigator.of(context).pushReplacement(
      PageTransition(child: page, type: type),
    );

void navigateAndRemove(
  BuildContext context, {
  required Widget page,
  PageTransitionType type = PageTransitionType.bottomToTop,
}) =>
    Navigator.of(context).pushAndRemoveUntil(
        PageTransition(child: page, type: type), (route) => false);
